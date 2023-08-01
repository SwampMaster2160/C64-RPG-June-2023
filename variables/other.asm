; Other variables
* = $0400
c64_chars ds 1000
* = c64_chars+1024-8
c64_sprite_pointers ds 8
* = $3000
sprite_shapes ds 64 * 8

sta_x_modable_0_address = sta_x_modable_0 + 1
sta_x_modable_1_address = sta_x_modable_1 + 1
lda_x_modable_address = lda_x_modable + 1
lda_y_modable_1_address = lda_y_modable_1 + 1