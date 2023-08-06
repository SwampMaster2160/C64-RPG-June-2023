; x: Entity
; y: Tile event

dummy_steped_on
	rts

door_outside_warp_tile_event_steped_on subroutine
	tya
	pha
	lda tile_event_extra_bytes,y
	tay
	lda map_heap,y
	sta current_map
	iny
	lda map_heap,y
	sta entity_x_positions,x
	iny
	lda map_heap,y
	sta entity_y_positions,x
	lda #1
	sta does_map_need_reload
	lda #(DIRECTION_UP | ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE | (15 << 2))
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags
	pla
	tay
	rts