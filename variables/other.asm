; Other variables
* = $0400
c64_chars ds 1000
* = c64_chars+1024-8
c64_sprite_pointers ds 8
* = $3000
sprite_shapes ds 64 * 8

sta_x_modable_address = sta_x_modable + 1