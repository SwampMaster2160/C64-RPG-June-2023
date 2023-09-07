	; Setup the compressor for a new map of metatiles
	mac newMapMetatiles
index set 0
		repeat 8
		setRecentMetatile index
index set index + 1
		repend
is_in_run set 0
	endm

	; Compress a row to 10 metatiles
	mac mapMetatileRow
		mapSingleMetatile {1}
		mapSingleMetatile {2}
		mapSingleMetatile {3}
		mapSingleMetatile {4}
		mapSingleMetatile {5}
		mapSingleMetatile {6}
		mapSingleMetatile {7}
		mapSingleMetatile {8}
		mapSingleMetatile {9}
		mapSingleMetatile {10}
	endm

	; End the compressor for the map and write any data that has not been written for the map
	mac endMapMetatiles
		if is_in_run
is_in_run set 0
			byte %10000000 | ((run_byte % 8) << 4) | (run_length - 1)
		endif
macro_map_id set macro_map_id + 1
	endm

; ----- Only used within this file -----
	
	; Store {1} in the recent metatile list at the index {1} % 8
	mac setRecentMetatile
.in_mod_8 set {1} % 8
		setRecentMetatileIndexVal .in_mod_8, {1}
	endm
	
	mac setRecentMetatileIndexVal
recent_metatile_{1} set {2}
	endm

	; Get from the recent metatile list at the index {1} % 8 and store it in recent_metatile
	mac getRecentMetatile
.in_mod_8 set {1} % 8
		getRecentMetatileIndexVal .in_mod_8
	endm

	mac getRecentMetatileIndexVal
recent_metatile set recent_metatile_{1}
	endm

	; Compress a single metatile
	mac mapSingleMetatile
		if is_in_run && (run_byte != {1} || run_length == 16)
			endMapMetatiles
		endif
		if is_in_run
run_length set run_length + 1
		else
			getRecentMetatile {1}
			if recent_metatile == {1}
is_in_run set 1
run_byte set {1}
run_length set 1
			else
				byte {1}
				setRecentMetatile {1}
			endif
		endif
	endm