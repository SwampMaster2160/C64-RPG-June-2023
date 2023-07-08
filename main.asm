	processor 6502
	include "c64_hardware.asm"

c64_screen_control_0_settings_no_scroll = C64_SCREEN_ON/* | C64_25_ROWS*/

; ----- Zeropage vars -----
	seg.u zeropage
* = 2
; ----- Zeropage vars -----

sta_x_modable ds 4
byte_a ds 1
byte_b ds 1
last_rng ds 1
screen_row_buffer ds 40
screen_color_buffer ds 40

; ----- .PRG File header -----
	seg file_header
* = $07FF
; ----- .PRG File header -----

	word file_content ; A pointer to where the program should be loaded to

; ----- Code loaded from disk -----
	seg code
* = $0801
; ----- Code loaded from disk -----

file_content subroutine
; BASIC program that runs when "RUN" is entered into the BASIC command line, jumps to "init" subroutine in machine code mode.
basic_program subroutine
.line_0
	word .end_line      ; Pointer to next line (end line)
	word 0              ; Line number
	byte $9E, "2061", 0 ; "SYS 2061" in bytecode, null terminated
.end_line
	word 0              ; Null pointer to next line (end line)

; BASIC program will jump here, BASIC is no longer required now.
init subroutine
	sei
	; Setup processor port (RAM layout and datasette control)
	lda #%00101111
	sta _6510_processor_port_bit_directions
	lda #%00100101
	sta _6510_processor_port_out_bits
	; Setup VIC-II
	lda #(0 | c64_screen_control_0_settings_no_scroll) ; No vertical scroll, 24 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #247                               ; Interrupt at line 247
	;lda #175                               ; Interrupt at line 175
	sta c64_screen_interrupt_line
	lda #(0 | C64_40_COLUMNS)                               ; No horizontal scroll, 38 columns, multicolor off
	;lda #(6)                               ; No horizontal scroll, 38 columns, multicolor off
	sta c64_screen_control_1
	lda #0                                 ; Disable sprites
	sta c64_sprite_enables
	lda #(4 << 1) | (1 << 4)               ; Tile shapes at $2000-$27FF, tile selections at $0400-$0800
	;sta c64_vic_memory_layout
	lda #1                                 ; Interrupt only when a set scanline is reached
	sta c64_vic_interrupt_control
	lda #0                                 ; Disable sprites
	sta c64_sprite_enables
	lda #$FF                               ; Acknowledge any outstanding VIC-II interrupts
	sta c64_vic_interrupt_status
	; CIA chips
	lda #$7F                               ; Disable interrupts from CIA chips
	sta $DC0D
	sta $DD0D
	lda $DC0D                              ; Acknowledge any outstanding CIA interrupts
	lda $DD0D
	lda #3                                 ; VIC bank 0
	sta $DD00
	; Set interrupt handler
	lda #<irq
	sta $FFFE
	lda #>irq
	sta $FFFF
	; Setup sta_imp
	lda #$9D            ; sta #$XXXX,x
	sta sta_x_modable
	lda #$60            ; rts
	sta sta_x_modable+3

	/*lda #C64_COLOR_BLACK
	sta c64_background_colors
	sta c64_border_color
	jsr clear_screen
	jsr display_all_chars*/
	;jsr display_all_chars
	;lda #0
	;sta $0400+1000-40-3
	lda #0
	sta byte_b
	sta last_rng
	;jsr move_screen_chars_down
	;jsr garble_top_screen_row

	;lda #$00
	;sta $0401
	;lda #$01
	;sta $0402
	;lda #$02
	;sta $0403
	; Loop untill interrupt
	cli
.loop
	jmp .loop

; Fills screen with tile 0 colored white
clear_screen subroutine
	; Clear the first 3 pages of the screen
	ldx #$00
.loop
	lda #$0
	sta $0400,x
	sta $0500,x
	sta $0600,x
	lda #C64_COLOR_WHITE
	sta c64_tile_colors,x
	sta c64_tile_colors+$100,x
	sta c64_tile_colors+$200,x
	inx
	bne .loop
	; Clear the last partial page of the screen such that a total of 1000 chars will have been cleared
	ldx #$0
.last_loop
	lda #$0
	sta $0700,x
	lda #C64_COLOR_WHITE
	sta c64_tile_colors+$300,x
	inx
	cpx #<1000
	bne .last_loop
	rts

; Display all 256 chars in the top left as a 16x16 box
display_all_chars subroutine
	; Load $0400 into sta_x_modable's address
	lda #$00
	sta sta_x_modable+1
	lda #$04
	sta sta_x_modable+2
	; Start with tile 0
	ldx #0
.loop
	; Draw tile
	txa
	jsr sta_x_modable
	; Increment tile count
	inx
	; Check if we should go to the next row (if the tile id is a multiple of 16)
	txa
	and #%00001111 ; a %= 16
	bne .skip_next_row
	; If so add (40-16) to sta_x_modable's address
	lda sta_x_modable+1
	clc
	adc #(40-16)
	sta sta_x_modable+1
	lda sta_x_modable+2
	adc #0
	sta sta_x_modable+2
	; If not then we will skip to here
.skip_next_row
	; If the tile number overflows to 0 then we have drawn all tiles so return
	txa
	bne .loop
	rts

irq subroutine
	; Disable interrupts and push a, x and y to onto the stack
	sei
	pha
	txa
	pha
	tya
	pha
	; Acknowledge interrupt
	lda #$FF
	sta c64_vic_interrupt_status

	lda #C64_COLOR_RED
	sta c64_border_color
	/*lda byte_b
	sec
	sbc #1
	and #%00000111
	sta byte_b
	ora #c64_screen_control_0_settings_no_scroll
	sta c64_screen_control_0
	lda byte_b
	cmp #7
	bne .skip_char_moves
	jsr move_screen_chars_up
	jsr garble_bottom_screen_row
.skip_char_moves*/
	;lda #247
	;lda #175
	;sta c64_screen_interrupt_line
	lda byte_b
	clc
	adc #1
	and #%00000111
	sta byte_b
	beq .skip_scroll_set
	ora #c64_screen_control_0_settings_no_scroll
	sta c64_screen_control_0
.skip_scroll_set
	lda byte_b
	cmp #0
	bne .skip_char_moves
	lda #C64_COLOR_ORANGE
	sta c64_border_color
	jsr move_screen_chars_down_pt_0
	lda #C64_COLOR_YELLOW
	sta c64_border_color
	lda #247
	sta c64_screen_interrupt_line
	lda byte_b
	ora #c64_screen_control_0_settings_no_scroll
	sta c64_screen_control_0
	jsr move_screen_chars_down_pt_1
	jsr garble_top_screen_row
	;lda #C64_COLOR_GREEN
	;sta c64_border_color
.skip_char_moves
	lda byte_b
	cmp #7
	bne .skip_interrupt_line_change
	lda #175
	sta c64_screen_interrupt_line
.skip_interrupt_line_change
	lda #C64_COLOR_GREEN
	sta c64_border_color
	; Pull a, x and y from the stack and return from interrupt
	pla
	tay
	pla
	tax
	pla
	cli
	rti

; Scrolls the screen's chars up 1 tile, leaves the bottom row unchanged.
move_screen_chars_up subroutine
	ldx #0
.loop_0
	lda $0400+40,x
	sta $0400,x
	inx
	bne .loop_0
.loop_1
	lda $0500+40,x
	sta $0500,x
	inx
	bne .loop_1
.loop_2
	lda $0600+40,x
	sta $0600,x
	inx
	bne .loop_2
.loop_3
	lda $0700+40,x
	sta $0700,x
	inx
	cpx #<(1000-40)
	bne .loop_3
	rts

; Scrolls the screen's chars down 1 tile, leaves the top row unchanged.
move_screen_chars_down_pt_0 subroutine
	ldx #$00
.loop_0
	lda $0600,x
	sta screen_row_buffer,x
	;lda c64_tile_colors+$200,x
	;sta screen_color_buffer,x
	inx
	cpx #40
	bne .loop_0
	ldx #$FF
.loop_1
	lda $0500,x
	sta $0500+40,x
	;lda c64_tile_colors+$100,x
	;sta c64_tile_colors+$100+40,x
	dex
	cpx #$FF
	bne .loop_1
	ldx #$FF
.loop_2
	lda $0400,x
	sta $0400+40,x
	;lda c64_tile_colors,x
	;sta c64_tile_colors+40,x
	dex
	cpx #$FF
	bne .loop_2
	ldx #$FF
	rts

; Scrolls the screen's chars down 1 tile, leaves the top row unchanged.
move_screen_chars_down_pt_1 subroutine
	ldx #<(999-40)
.loop_0
	lda $0700,x
	sta $0700+40,x
	;lda c64_tile_colors+$300,x
	;sta c64_tile_colors+$300+40,x
	dex
	cpx #$FF
	bne .loop_0
.loop_1
	lda $0600,x
	sta $0600+40,x
	;lda c64_tile_colors+$200,x
	;sta c64_tile_colors+$200+40,x
	dex
	cpx #$FF
	bne .loop_1
	ldx #0
.loop_2
	;lda $0600,x
	lda screen_row_buffer,x
	sta $0600+40,x
	;lda screen_color_buffer,x
	;sta c64_tile_colors+$200+40,x
	inx
	cpx #40
	bne .loop_2
	ldx #$FF

	rts

garble_bottom_screen_row subroutine
	ldx #0
.loop
	lda byte_a
	sta $0400+1000-40,x
	inc byte_a
	inx
	cpx #40
	bne .loop
	rts

garble_top_screen_row subroutine
	ldx #0
.loop_0
	jsr rng
	sta $0400,x
	inx
	cpx #40
	bne .loop_0
	ldx #0
.loop_1
	jsr rng
	rol
	rol
	rol
	rol
	sta c64_tile_colors,x
	inx
	cpx #40
	bne .loop_1
	rts

; Calculates a new random u8
; --- Outputs ---
; a: the random number generated
rng subroutine
	; Calculate last_rng * 5 + 1
	lda last_rng
	asl
	asl
	clc
	adc last_rng
	clc
	adc #1
	; Store back in last_rng and return
	sta last_rng
	rts

* = $2000
	byte $00, $00, $00, $00, $00, $00, $00, $00
	byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	byte #%10101010, #%01010101, #%10101010, #%01010101, #%10101010, #%01010101, #%10101010, #%01010101