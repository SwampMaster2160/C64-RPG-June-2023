tile_events = tile_events_actual - 4

	align 2
tile_events_actual subroutine
	tileEventData door_outside_warp_tile_event_steped_on, dummy_looked_at ; Door warp outside
	tileEventData dummy_steped_on, door_inside_warp_tile_event_steped_on  ; Door warp inside