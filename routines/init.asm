; BASIC program will jump here, BASIC is no longer required now.
init subroutine
	sei
	; Setup processor port (RAM layout and datasette control)
	lda #%00101111
	sta _6510_processor_port_bit_directions
	lda #%00100101
	sta _6510_processor_port_out_bits
	; CIA chips
	lda #$7F  ; Disable interrupts from CIA chips
	sta $DC0D
	sta $DD0D
	lda $DC0D ; Acknowledge any outstanding CIA interrupts
	lda $DD0D
	lda #%11111111
	sta $DD02
	lda #0    ; VIC bank 3
	sta $DD00
	lda #%11111111
	sta $DC02
	lda #%00000000
	sta $DC03
	; Setup VIC-II
	lda #((3 | C64_25_ROWS) | %10000000)            ; No vertical scroll, 25 rows, screen off, text mode, extended background off
	sta c64_screen_control_0
	lda #32                                         ; Interrupt at line 288
	sta c64_screen_interrupt_line
	lda #(0 | C64_40_COLUMNS | C64_MULTICOLOR_MODE) ; No horizontal scroll, 40 columns, multicolor on
	sta c64_screen_control_1
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
	lda #($90)+7
.set_sprite_pointers_loop
	sta c64_sprite_pointers,x
	sec
	sbc #1
	dex
	bpl .set_sprite_pointers_loop
	; Clear sprite images
	ldx #$FF
	lda #0
.clear_sprite_loop
	dex
	sta sprite_shapes,x
	sta sprite_shapes+$0100,x
	cpx #$FF
	bne .clear_sprite_loop
	; Set interrupt handler
	lda #<irq
	sta $FFFE
	lda #>irq
	sta $FFFF
	; Load chars
	ldx #0
.load_gui_chars_loop
	lda gui_chars,x
	sta gui_chars_loaded+8*32,x
	lda gui_chars+$100,x
	sta gui_chars_loaded+8*32+$100,x
	lda gui_chars+$200,x
	sta gui_chars_loaded+8*32+$200,x
	lda gui_chars+$300,x
	sta gui_chars_loaded+8*32+$300,x
	lda gui_chars+$400,x
	sta gui_chars_loaded+8*32+$400,x
	lda gui_chars+$500,x
	sta gui_chars_loaded+8*32+$500,x
	lda gui_chars+$600,x
	sta gui_chars_loaded+8*32+$600,x
	inx
	bne .load_gui_chars_loop

.load_world_chars_loop
	lda world_chars,x
	sta world_chars_loaded,x
	lda world_chars+$100,x
	sta world_chars_loaded+$100,x
	lda world_chars+$200,x
	sta world_chars_loaded+$200,x
	lda world_chars+$300,x
	sta world_chars_loaded+$300,x
	lda world_chars+$400,x
	sta world_chars_loaded+$400,x
	lda world_chars+$500,x
	sta world_chars_loaded+$500,x
	lda world_chars+$600,x
	sta world_chars_loaded+$600,x
	lda world_chars+$700,x
	sta world_chars_loaded+$700,x
	inx
	bne .load_world_chars_loop
	; Clear flags
	ldx #31
	lda #0
.clear_flags_loop
	sta plot_completion_flags,x
	dex
	bpl .clear_flags_loop
	; Init vars
	lda #GAMESTATE_INGAME
	sta gamestate
	lda #0
	sta is_next_screen_interrupt_for_gui
	lda #0
	sta last_rng
	lda #C64_COLOR_BLACK
	sta gui_background_color

	jsr init_player
	lda #MAP_LONGTOWN_0;MAP_NEWTOWN
	sta map_id
	jsr load_map
	jsr get_keys_pressed
	lda #1
	sta does_hud_need_redraw
	
	; Loop untill interrupt
	cli
.loop
	jmp .loop