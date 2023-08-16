; Other variables
* = $E000;$0400+$C000
c64_chars ds 1000
* = c64_chars+1024-8
c64_sprite_pointers ds 8
* = $E400;$3000+$C000
sprite_shapes ds 64 * 8
* = $C000
gui_chars_loaded
* = $C800
world_chars_loaded