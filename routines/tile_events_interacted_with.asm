; x: Entity
; y: Tile event

dummy_interacted_with subroutine
	rts

wall_gate_interacted_with subroutine
	; Push x since we don't need to know what entity is interacting with the gate
	txa
	pha
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Return if the gate is open
	lda map_heap,x
	jsr is_plot_completion_flag_set
	bne .end
	; Return if key has not been collected
	lda #PLOT_COMPLETION_FLAG_GOT_GATE_KEY
	jsr is_plot_completion_flag_set
	beq .no_key
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Set gate as open
	lda map_heap,x
	jsr set_plot_completion_flag
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Change gate tile to a path tile
	lda map_heap+1,x
	tax
	lda #METATILE_DIRT_PATH_HORIZONTAL
	sta map_metatiles,x
	lda #1
	sta does_map_need_redraw
	; Print text
	lda #<gate_opened_script
	sta script_address
	lda #>gate_opened_script
	sta script_address+1
	jsr execute_script
	; Restore x and return
.end
	pla
	tax
	rts
.no_key
	; Print text
	lda #<gate_no_key_script
	sta script_address
	lda #>gate_no_key_script
	sta script_address+1
	jsr execute_script
	jmp .end