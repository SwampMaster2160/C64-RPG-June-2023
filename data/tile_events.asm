tile_events = tile_events_actual - 8

	align 2
tile_events_actual subroutine
	tileEventData door_outside_warp_tile_event_steped_on,  dummy_looked_at,                       dummy_interacted_with          ; Door warp outside
	tileEventData dummy_steped_on,                         door_inside_warp_tile_event_looked_at, dummy_interacted_with          ; Door warp inside
	tileEventData cave_entrence_left_right_warp_steped_on, dummy_looked_at,                       dummy_interacted_with          ; Cave entrence left right warp
	tileEventData dummy_steped_on,                         dummy_looked_at,                       wall_gate_interacted_with      ; Wall gate
	tileEventData dummy_steped_on,                         dummy_looked_at,                       fallen_tree_interacted_with    ; Fallen tree
	tileEventData dummy_steped_on,                         dummy_looked_at,                       choppable_tree_interacted_with ; Choppable tree
	tileEventData dummy_steped_on,                         dummy_looked_at,                       deep_river_interacted_with     ; Make water shallow
	tileEventData dummy_steped_on,                         dummy_looked_at,                       broken_bridge_interacted_with  ; Repair bridge