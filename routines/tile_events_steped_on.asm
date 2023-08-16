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
	sta map_id
	iny
	lda map_heap,y
	sta entity_x_positions,x
	iny
	lda map_heap,y
	sta entity_y_positions,x
	lda #1
	sta does_map_need_reload
	lda #(DIRECTION_UP | ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE | (15 << 2))
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	pla
	tay
	rts

cave_entrence_left_right_warp_steped_on subroutine
	tya
	pha
	lda tile_event_extra_bytes,y
	tay
	lda map_heap,y
	sta map_id
	iny
	lda map_heap,y
	sta entity_x_positions,x
	lda #1
	sta does_map_need_reload
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00000011
	ora #(ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE | (15 << 2))
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	pla
	tay
	rts