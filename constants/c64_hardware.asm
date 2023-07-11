; ----- C64 Hardware Constants -----

; Colors
C64_COLOR_BLACK = 0
C64_COLOR_WHITE = 1
C64_COLOR_RED = 2
C64_COLOR_CYAN = 3
C64_COLOR_MAGENTA = 4
C64_COLOR_GREEN = 5
C64_COLOR_BLUE = 6
C64_COLOR_YELLOW = 7
C64_COLOR_ORANGE = 8
C64_COLOR_BROWN = 9
C64_COLOR_PINK = 10
C64_COLOR_DARK_GREY = 11
C64_COLOR_GREY = 12
C64_COLOR_LIME = 13
C64_COLOR_LIGHT_BLUE = 14
C64_COLOR_LIGHT_GREY = 15

; Bitflags for c64_screen_control_0
C64_25_ROWS = %00001000
C64_SCREEN_ON = %00010000
C64_BITMAP_MODE = %00100000
C64_EXTENDED_BACKGROUND_ENABLE = %00100000

; Bitflags for c64_screen_control_1
C64_40_COLUMNS = %00001000
C64_MULTICOLOR_MODE = %00010000

; ----- 6510 Hardware -----
	seg.u 6510_hardware
; ----- 6510 Hardware -----

; Data Port
* = $0000
_6510_processor_port_bit_directions ds 1
_6510_processor_port_out_bits ds 1

; ----- C64 Hardware -----
	seg.u c64_hardware
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

; Color RAM
* = $D800
c64_tile_colors ds 1000