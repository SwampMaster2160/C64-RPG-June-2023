tile_events = tile_events_actual - 4

	align 2
tile_events_actual subroutine
	tileEventData door_outside_warp_tile_event_steped_on,  dummy_looked_at                       ; Door warp outside
	tileEventData dummy_steped_on,                         door_inside_warp_tile_event_looked_at ; Door warp inside
	tileEventData cave_entrence_left_right_warp_steped_on, dummy_looked_at                       ; Cave entrence left right warp