* = 2
last_rng ds 1
byte_0 ds 1
byte_1 ds 1
temp_x ds 1
temp_y ds 1
word_0 ds 2
word_1 ds 2
word_2 ds 2
text_color ds 1
world_background_color ds 1
world_sprites_visable ds 1
gui_background_color ds 1
is_next_screen_interrupt_for_gui ds 1
map_id ds 1
does_map_need_redraw ds 1
entity_discriminants ds 8
entity_x_positions ds 8
entity_y_positions ds 8
entity_facing_directions_and_walk_offsets_and_redraw_flags ds 8
is_up_key_pressed ds 1
is_right_key_pressed ds 1
is_down_key_pressed ds 1
is_left_key_pressed ds 1
is_action_key_pressed ds 1
was_action_key_pressed_last_frame ds 1
does_hud_need_redraw ds 1
text_cursor_address ds 2
script_address ds 2
tile_event_discriminants ds MAX_TILE_EVENTS
tile_event_x_positions ds MAX_TILE_EVENTS
tile_event_y_positions ds MAX_TILE_EVENTS
tile_event_extra_bytes ds MAX_TILE_EVENTS
does_map_need_reload ds 1
map_heap_size ds 1
map_colors ds 1
map_border_connections ds 4
map_name_address ds 2
suspended_script_address ds 2
gamestate ds 1

	echo "Zeropage vars end:",[*]