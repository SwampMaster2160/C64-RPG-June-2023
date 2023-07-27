; BASIC program will jump here, BASIC is no longer required now.
init subroutine
	sei
	; Setup processor port (RAM layout and datasette control)
	lda #%00101111
	sta _6510_processor_port_bit_directions
	lda #%00100101
	sta _6510_processor_port_out_bits
	; Setup VIC-II
	lda #((3 | C64_25_ROWS) | %10000000)            ; No vertical scroll, 25 rows, screen off, text mode, extended background off
	sta c64_screen_control_0
	lda #32                                         ; Interrupt at line 288
	sta c64_screen_interrupt_line
	lda #(0 | C64_40_COLUMNS | C64_MULTICOLOR_MODE) ; No horizontal scroll, 40 columns, multicolor on
	sta c64_screen_control_1
	;lda #0                                          ; Disable sprites
	;sta c64_sprite_enables
	lda #(4 << 1) | (1 << 4)                        ; Tile shapes at $2000-$27FF, tile selections at $0400-$0800
	sta c64_vic_memory_layout
	lda #1                                          ; Interrupt only when a set scanline is reached
	sta c64_vic_interrupt_control
	lda #0                                          ; Disable sprites
	sta c64_sprite_enables
	lda #$FF                                        ; Acknowledge any outstanding VIC-II interrupts
	sta c64_vic_interrupt_status
	lda #0                                          ; Sprites are single width and height
	sta c64_sprite_double_heights
	sta c64_sprite_double_widths
	lda #0                                          ; Draw sprites infront of screen
	sta c64_sprite_priorities
	lda #$FF                                        ; Sprites are multicolor
	sta c64_sprite_multicolors
	lda #C64_COLOR_BLACK                            ; Extra sprite colors and black and light grey
	sta c64_sprites_color_1
	lda #C64_COLOR_LIGHT_GREY
	sta c64_sprites_color_2
	; Set sprite pointers
	ldx #7
	lda #($C0)+7
.set_sprite_pointers_loop
	sta c64_sprite_pointers,x
	sec
	sbc #1
	dex
	bpl .set_sprite_pointers_loop
	; CIA chips
	lda #$7F  ; Disable interrupts from CIA chips
	sta $DC0D
	sta $DD0D
	lda $DC0D ; Acknowledge any outstanding CIA interrupts
	lda $DD0D
	lda #3    ; VIC bank 0
	sta $DD00
	lda #%11111111
	sta $DC02
	lda #%00000000
	sta $DC03
	; Set interrupt handler
	lda #<irq
	sta $FFFE
	lda #>irq
	sta $FFFF
	; Init vars
	lda #0
	sta is_next_screen_interrupt_for_gui
	lda #0
	sta last_rng
	lda #C64_COLOR_BLACK
	sta gui_background_color

	lda #MAP_NEWTOWN
	jsr load_map
	jsr init_player
	jsr get_keys_pressed
	lda #<(c64_chars+(20*40))
	sta sta_x_modable_0_address
	lda #>(c64_chars+(20*40))
	sta sta_x_modable_0_address+1
	lda #C64_COLOR_WHITE
	sta text_color
	ldx #40
	ldy #5
	jsr draw_textbox
	
	; Loop untill interrupt
	cli
.loop
	jmp .loop