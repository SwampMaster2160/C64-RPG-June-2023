; World chars
world_chars subroutine
	byte 255, 255, 255, 255, 255, 255, 255, 255 ; Blank

	byte  40,  40,  34,  34,  10,  10,  42,  42 ; House roof bottom left
	byte   0, 238, 187, 238, 187, 238, 187, 238 ; Flat roof top
	byte   0, 140, 140, 128, 140, 140, 128, 170 ; Window left with roof above
	byte   0, 202, 202,  10, 202, 202,  10, 170 ; Window right with roof above
	byte  59,  46,  59,  46,  59,  46,  59,  46 ; Flat roof left
	byte  40,  40, 136, 136, 160, 160, 168, 168 ; House roof bottom right
	byte 247,  63,  15,  15,  33,  35,  40,  40 ; House roof top right
	byte   0,  42,  42,  32,  35,  32,  35,  32 ; Door top left with roof above and left wall
	byte  34,  34,  34,  34,  34,  34,  34,   0 ; Door bottom left with floor and left wall
	byte 247, 124, 240, 208, 200, 200,  40,  40 ; House roof top left
	byte 252, 168, 188, 168, 252, 168, 188,   0 ; Building bricks with floor and right wall
	byte 162, 162, 178, 162, 162, 162, 162,   0 ; Door bottom right with floor
	byte 254, 170, 191, 170, 254, 170, 191,   0 ; Building bricks with floor
	byte   0, 170, 170,   2,  50,   2,  50,   2 ; Door top right with roof above
	byte   0, 200, 200,   8, 200, 200,   8, 168 ; Window right with right wall
	byte   0,  46,  59,  46,  59,  46,  59,  46 ; Flat roof top left
	byte 184, 236, 184, 236, 184, 236, 184, 236 ; Flat roof right
	byte   0, 236, 184, 236, 184, 236, 184, 236 ; Flat roof top right
	byte 187, 238, 187, 238, 187, 238, 187, 238 ; Flat roof

	byte 255, 221, 255, 223, 119, 255, 223, 247 ; Grass 0
	byte 255, 221, 255, 119, 255, 223, 247, 127 ; Grass 1
	byte  48,  12,  48,  12,  48,  12,  48,  12 ; Gutter Vertical
	byte   0, 204,  51, 204,  51, 204,  51,   0 ; Gutter Horizontal
	byte  48, 204,  48, 204,  48, 204,  48,   0 ; Gutter up left
	byte  48,  12,  51,  12,  51,  12,  51,   0 ; Gutter up right
	byte   0, 204,  48, 204,  48, 204,  48,  12 ; Gutter down left
	byte   0,  12,  51,  12,  51,  12,  51,  12 ; Gutter down right
	byte  12,  51, 204,  48, 192,  51, 204,   3 ; Shallow water
	byte 255, 255, 239, 187, 255, 251, 238, 255 ; Sand

	byte 254, 126, 254, 222, 254, 254, 126, 255 ; Tree trunk left
	byte 191, 183, 191, 191, 191, 189, 191, 255 ; Tree trunk right
	byte 253, 247, 221, 119, 221, 247, 221, 247 ; Tree canopy left
	byte 223, 119, 223, 119, 221, 119, 223, 127 ; Tree canopy right

	byte 255, 207,  51, 255, 255, 243, 204, 255 ; Water
	
	byte 250, 126, 250, 234, 218, 254, 122, 250 ; Dirt path left
	byte 186, 171, 234, 174, 170, 235, 170, 174 ; Dirt path
	byte 175, 173, 191, 175, 169, 175, 183, 175 ; Dirt path right
	byte 127, 247, 127, 253, 219, 170, 170, 170 ; Dirt path top
	byte 170, 170, 170, 230, 223, 119, 255, 221 ; Dirt path bottom
	byte 122, 250, 126, 250, 234, 170, 170, 170 ; Dirt path top left
	byte 175, 183, 175, 173, 171, 170, 170, 170 ; Dirt path top right
	byte 170, 170, 170, 234, 218, 118, 250, 218 ; Dirt path bottom left
	byte 170, 170, 170, 166, 175, 183, 191, 173 ; Dirt path bottom right
	byte 255, 238, 255, 170, 251, 191, 255, 170 ; Boardwalk vertical
	byte 187, 190, 191, 170, 175, 187, 191, 170 ; Boardwalk left
	byte 254, 250, 238, 170, 254, 238, 254, 170 ; Boardwalk right
	byte 251, 187, 235, 250, 251, 187, 250, 235 ; Boardwalk hozizontal
	byte 170, 251, 187, 250, 187, 235, 187, 251 ; Boardwalk top
	byte 251, 251, 187, 250, 251, 187, 251, 170 ; Boardwalk bottom

	byte 238, 187, 234, 171, 238, 186, 254, 234 ; Rocks top left
	byte 238, 187, 235, 187, 238, 251, 190, 239 ; Rocks top right
	byte 250, 238, 234, 235, 190, 186, 239, 186 ; Rocks bottom left
	byte 174, 175, 186, 175, 174, 187, 238, 187 ; Rocks bottom right

	byte  86, 170, 101, 170,  86, 170, 101, 170 ; Inside wall
	byte  85, 106,  85, 106,  85, 106,  85, 106 ; Inside floor
	byte 255, 213, 221, 215, 221, 215, 221, 215 ; Mat top left
	byte 221, 215, 221, 215, 221, 215, 213, 255 ; Mat bottom left
	byte 255,  85, 221, 119, 221, 119, 221, 119 ; Mat top
	byte 221, 119, 221, 119, 221, 119,  85, 255 ; Mat bottom
	byte 255,  87, 215, 119, 215, 119, 215, 119 ; Mat top right
	byte 215, 119, 215, 119, 215, 119,  87, 255 ; Mat bottom right

	byte 0,   12,  12,  0,   12,  12,    0, 42  ; Window left with left wall
	byte 62,  42,  63,  42,  62,  42,   63, 0   ; Building bricks with floor and left wall
	byte 237, 170, 170, 111, 231, 170, 170, 231 ; Fence bottom
	byte 223, 247, 127, 231, 111, 170, 170, 231 ; Fence top

	byte 234, 250, 250, 254, 254, 254, 254, 254 ; Right tunnel entrance top
	byte 254, 254, 254, 254, 254, 250, 250, 234 ; Right tunnel entrance bottom
	byte 171, 175, 175, 191, 191, 191, 191, 191 ; Left tunnel entrance top
	byte 191, 191, 191, 191, 191, 175, 175, 171 ; Left tunnel entrance bottom