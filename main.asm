	processor 6502
	include "c64_hardware.asm"

; ----- Zeropage vars -----
	seg.u zeropage
* = 2
; ----- Zeropage vars -----

sta_x_modable ds 4
byte_a ds 1
byte_b ds 1
last_rng ds 1

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
; A BASIC program consists of a singily linked list where each node contains:
; A pointer to the next line node
; A line number
; BASIC bytecode for the line.
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
	lda #((3 | C64_SCREEN_ON | C64_25_ROWS) | %10000000) ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #32                                              ; Interrupt at line 288
	sta c64_screen_interrupt_line
	lda #(0 | C64_40_COLUMNS)                            ; No horizontal scroll, 40 columns, multicolor off
	sta c64_screen_control_1
	lda #0                                               ; Disable sprites
	sta c64_sprite_enables
	lda #(4 << 1) | (1 << 4)                             ; Tile shapes at $2000-$27FF, tile selections at $0400-$0800
	sta c64_vic_memory_layout
	lda #1                                               ; Interrupt only when a set scanline is reached
	sta c64_vic_interrupt_control
	lda #0                                               ; Disable sprites
	sta c64_sprite_enables
	lda #$FF                                             ; Acknowledge any outstanding VIC-II interrupts
	sta c64_vic_interrupt_status
	; CIA chips
	lda #$7F  ; Disable interrupts from CIA chips
	sta $DC0D
	sta $DD0D
	lda $DC0D ; Acknowledge any outstanding CIA interrupts
	lda $DD0D
	lda #3    ; VIC bank 0
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
	sta last_rng

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
	pha
	txa
	pha
	tya
	pha
	; Acknowledge interrupt
	lda #$FF
	sta c64_vic_interrupt_status

	inc c64_border_color
	; Pull a, x and y from stack
	pla
	tay
	pla
	tax
	pla
	rti

; Calculates a new random byte
; --- Inputs ---
; last_rng: The seed for the algorithm
; --- Outputs ---
; a:        The random number generated (last_rng * 5 + 1)
; last_rng: Also the random number generated
rng subroutine
	; Calculate last_rng * 5 + 1
	lda last_rng
	asl
	asl
	clc
	adc last_rng
	clc
	adc #1
	; Store back in last_rng
	sta last_rng
	; Return the number generated
	rts

* = $2000
	include "data/world_chars.asm"