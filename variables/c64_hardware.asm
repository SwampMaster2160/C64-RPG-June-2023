; ----- 6510 Hardware -----

; Data Port
* = $0000
_6510_processor_port_bit_directions ds 1
_6510_processor_port_out_bits ds 1

; ----- C64 Hardware -----

; VIC-II
* = $D000
c64_sprite_coordinates ds 16
c64_sprite_y_heigh_bits ds 1
c64_screen_control_0 ds 1
c64_screen_interrupt_line ds 1
c64_light_pen_x ds 1
c64_light_pen_y ds 1
c64_sprite_enables ds 1
c64_screen_control_1 ds 1
c64_sprite_double_heights ds 1
c64_vic_memory_layout ds 1
c64_vic_interrupt_status ds 1
c64_vic_interrupt_control ds 1
c64_sprite_priorities ds 1
c64_sprite_multicolors ds 1
c64_sprite_double_widths ds 1
c64_sprite_sprite_collisions ds 1
c64_sprite_background_collisions ds 1
c64_border_color ds 1
c64_background_colors ds 4
c64_sprites_color_1 ds 1
c64_sprites_color_2 ds 1
c64_sprite_color_0s ds 8

; CIA #1
* = $DC00
c64_keyboard_row_and_paddle_selection_and_port_2_joystick_buttons_pressed ds 1
c64_keyboard_and_port_1_joystick_buttons_pressed ds 1

; Color RAM
* = $D800
c64_char_colors ds 1000