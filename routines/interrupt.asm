; Called on each hardware interrupt
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
	;inc c64_border_color
	; Call gui or world interrupt handeler
	lda is_next_screen_interrupt_for_gui
	beq .skip_gui_interrupt
	jsr gui_interrupt
	jmp .end
.skip_gui_interrupt
	jsr world_interrupt
.end
	; Pull a, x and y from stack
	pla
	tay
	pla
	tax
	pla
	rti

gui_interrupt subroutine
	; Setup for world interrupt
	lda #((3 | C64_SCREEN_ON | C64_25_ROWS) | %10000000) ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #32                                              ; Interrupt at line 288
	sta c64_screen_interrupt_line
	lda #0
	sta is_next_screen_interrupt_for_gui
	; Change graphics modes
	lda gui_background_color
	sta c64_background_colors
	lda #(5 << 1) | (1 << 4)  ; Tile shapes at $27FF-$3000, tile selections at $0400-$0800
	sta c64_vic_memory_layout
	lda #(0 | C64_40_COLUMNS) ; No horizontal scroll, 40 columns, multicolor off
	sta c64_screen_control_1
	; Return
	rts

world_interrupt subroutine
	; Change graphics modes
	lda world_background_color
	sta c64_background_colors
	lda #(4 << 1) | (1 << 4)                        ; Tile shapes at $2000-$27FF, tile selections at $0400-$0800
	sta c64_vic_memory_layout
	lda #(0 | C64_40_COLUMNS | C64_MULTICOLOR_MODE) ; No horizontal scroll, 40 columns, multicolor on
	sta c64_screen_control_1
	; Setup for GUI interrupt
	lda #(3 | C64_SCREEN_ON | C64_25_ROWS) ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #210                               ; Interrupt at line 210
	sta c64_screen_interrupt_line
	lda #1
	sta is_next_screen_interrupt_for_gui
	; Return
	rts