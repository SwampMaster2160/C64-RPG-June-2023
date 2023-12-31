; Called on each hardware interrupt
irq subroutine
	; Disable interrupts and push a, x and y to onto the stack
	pha
	txa
	pha
	tya
	pha
	; Call gui or world interrupt handeler
	lda is_next_screen_interrupt_for_gui
	beq .skip_gui_interrupt
	jsr gui_interrupt
	jmp .end
.skip_gui_interrupt
	jsr world_interrupt
.end
	; Acknowledge interrupt
	lda #$FF
	sta c64_vic_interrupt_status
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
	lda #(0 << 1) | (8 << 4)                        ; Tile shapes at $C000-$C7FF, tile selections at $E000-$E3FF
	sta c64_vic_memory_layout
	lda #(0 | C64_40_COLUMNS) ; No horizontal scroll, 40 columns, multicolor off
	sta c64_screen_control_1
	lda #0
	sta c64_sprite_enables
	; Return
	rts

world_interrupt subroutine
	; Setup for GUI interrupt
	lda #210                      ; Interrupt at line 210
	sta c64_screen_interrupt_line
	lda #1
	sta is_next_screen_interrupt_for_gui
	; Change graphics mode 0
	lda #(3 | C64_25_ROWS | C64_SCREEN_ON)          ; No vertical scroll, 25 rows, text mode, extended background off, screen on
	sta c64_screen_control_0
	; Change other graphics modes
	lda world_background_color                      ; Change background colors to the world background colors
	sta c64_background_colors
	lda #(1 << 1) | (8 << 4)                        ; Tile shapes at $C800-$CFFF, tile selections at $E000-$E3FF
	sta c64_vic_memory_layout
	lda #(0 | C64_40_COLUMNS | C64_MULTICOLOR_MODE) ; No horizontal scroll, 40 columns, multicolor on
	sta c64_screen_control_1
	lda world_sprites_visable
	sta c64_sprite_enables
	; World ticks
	jsr world_tick
	; Update graphics each frame
	jsr redraw
	; Change other graphics modes
	lda world_background_color                      ; Change background colors to the world background colors
	sta c64_background_colors
	lda #(1 << 1) | (8 << 4)                        ; Tile shapes at $C800-$CFFF, tile selections at $E000-$E3FF
	sta c64_vic_memory_layout
	lda #(0 | C64_40_COLUMNS | C64_MULTICOLOR_MODE) ; No horizontal scroll, 40 columns, multicolor on
	sta c64_screen_control_1
	lda world_sprites_visable
	sta c64_sprite_enables
	lda #(3 | C64_25_ROWS | C64_SCREEN_ON)          ; No vertical scroll, 25 rows, text mode, extended background off, screen on
	sta c64_screen_control_0
	; Return
	rts