	; Header data for a map
	; Border color, tile colors pallete, north, east, south, west map connections, pointer to the map name
	mac mapExtraData
		byte {1} | ({2} << 4)
.full_north_connection = {3} != macro_map_id - 1 && {3} != MAP_IRRELEVANT
.full_east_connection = {4} != macro_map_id + 1 && {4} != MAP_IRRELEVANT
.full_south_connection = {5} != macro_map_id + 1 && {5} != MAP_IRRELEVANT
.full_west_connection = {6} != macro_map_id - 1 && {6} != MAP_IRRELEVANT
		byte .full_north_connection | (.full_east_connection << 1) | (.full_south_connection << 2) | (.full_west_connection << 3)
		if .full_north_connection
			byte {3}
		endif
		if .full_east_connection
			byte {4}
		endif
		if .full_south_connection
			byte {5}
		endif
		if .full_west_connection
			byte {6}
		endif
		word {7}
macro_map_id set macro_map_id + 1
		newMapMetatiles
	endm

	mac tileExtraData
		byte {1} | {5} << 4, {2}, {3}, {4}
	endm

	mac entityData
		byte {1}, {2}, {3}, {4}, {5}, 0, 0, 0
		word {6}, {7}, 0, 0
	endm

	; Start x, start y, end x, end y
	mac tileEventPos
		byte {1} | (({3} - {1}) << 5), {2} | ({4} << 4)
	endm

	mac tileEventData
		word {1}, {2}, {3}, 0
	endm