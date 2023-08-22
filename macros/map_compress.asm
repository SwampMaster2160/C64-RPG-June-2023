	mac setRecentMetatile
.in_mod_8 set {1} % 8
		if .in_mod_8 == 0
recent_metatile_0 set {1}
			mexit
		endif
		if .in_mod_8 == 1
recent_metatile_1 set {1}
			mexit
		endif
		if .in_mod_8 == 2
recent_metatile_2 set {1}
			mexit
		endif
		if .in_mod_8 == 3
recent_metatile_3 set {1}
			mexit
		endif
		if .in_mod_8 == 4
recent_metatile_4 set {1}
			mexit
		endif
		if .in_mod_8 == 5
recent_metatile_5 set {1}
			mexit
		endif
		if .in_mod_8 == 6
recent_metatile_6 set {1}
			mexit
		endif
recent_metatile_7 set {1}
	endm

	; Gets the recent metatile with the index {1} % 8 and stores it in recent_metatile
	mac getRecentMetatile
.in_mod_8 set {1} % 8
		if .in_mod_8 == 0
recent_metatile set recent_metatile_0
			mexit
		endif
		if .in_mod_8 == 1
recent_metatile set recent_metatile_1
			mexit
		endif
		if .in_mod_8 == 2
recent_metatile set recent_metatile_2
			mexit
		endif
		if .in_mod_8 == 3
recent_metatile set recent_metatile_3
			mexit
		endif
		if .in_mod_8 == 4
recent_metatile set recent_metatile_4
			mexit
		endif
		if .in_mod_8 == 5
recent_metatile set recent_metatile_5
			mexit
		endif
		if .in_mod_8 == 6
recent_metatile set recent_metatile_6
			mexit
		endif
recent_metatile set recent_metatile_7
	endm
	
	mac newMapMetatiles
index set 0
		repeat 8
		setRecentMetatile index
index set index + 1
		repend
is_in_run set 0
	endm

	mac mapMetatileRow
.index set 1
		repeat 10
			mapSingleMetatile {.index}
.index set .index + 1
		repend
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
run_length set 0
			else
				byte {1}
				setRecentMetatile {1}
				echo "B", {1}
			endif
		endif
	endm

	mac endMapMetatiles
		if is_in_run
is_in_run set 0
			byte %10000000 | ((run_byte % 8) << 4) | (run_length - 1)
			echo "B", %10000000 | ((run_byte % 8) << 4) | (run_length - 1)
		endif
	endm