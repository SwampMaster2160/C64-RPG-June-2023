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
	lda #0                                          ; Disable sprites
	sta c64_sprite_enables
	lda #(4 << 1) | (1 << 4)                        ; Tile shapes at $2000-$27FF, tile selections at $0400-$0800
	;lda #(5 << 1) | (1 << 4)                       ; Tile shapes at $27FF-$3000, tile selections at $0400-$0800
	sta c64_vic_memory_layout
	lda #1                                          ; Interrupt only when a set scanline is reached
	sta c64_vic_interrupt_control
	lda #0                                          ; Disable sprites
	sta c64_sprite_enables
	lda #$FF                                        ; Acknowledge any outstanding VIC-II interrupts
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
	; Setup sta_x_modable_0
	lda #$9D            ; sta #$XXXX,x
	sta sta_x_modable_0
	lda #$60            ; rts
	sta sta_x_modable_0+3
	; Setup sta_x_modable_1
	lda #$9D            ; sta #$XXXX,x
	sta sta_x_modable_1
	lda #$60            ; rts
	sta sta_x_modable_1+3
	; Setup lda_x_modable
	lda #$BD            ; lda #$XXXX,x
	sta lda_x_modable
	lda #$60            ; rts
	sta lda_x_modable+3
	; Setup lda_y_modable_0
	lda #$B9            ; lda #$XXXX,y
	sta lda_y_modable_0
	lda #$60            ; rts
	sta lda_y_modable_0+3
	; Setup lda_y_modable_1
	lda #$B9            ; lda #$XXXX,y
	sta lda_y_modable_1
	lda #$60            ; rts
	sta lda_y_modable_1+3
	; Init vars
	lda #0
	sta is_next_screen_interrupt_for_gui
	lda #0
	sta last_rng
	lda #C64_COLOR_BLACK
	sta gui_background_color

	;lda #C64_COLOR_BLACK
	;sta c64_background_colors
	/*sta c64_border_color
	jsr clear_screen
	jsr display_all_chars*/
	;jsr display_all_chars

	lda #0
	jsr draw_map
	;jsr display_all_chars
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