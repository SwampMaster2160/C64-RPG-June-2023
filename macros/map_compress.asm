	mac setRecentMetatile
in_mod_8 set {1} % 8
	if in_mod_8 == 0
recent_0 set {1}
	mexit
	endif
	if in_mod_8 == 1
recent_1 set {1}
	mexit
	endif
	if in_mod_8 == 2
recent_2 set {1}
	mexit
	endif
	if in_mod_8 == 3
recent_3 set {1}
	mexit
	endif
	if in_mod_8 == 4
recent_4 set {1}
	mexit
	endif
	if in_mod_8 == 5
recent_5 set {1}
	mexit
	endif
	if in_mod_8 == 6
recent_6 set {1}
	mexit
	endif
recent_7 set {1}
	endm
	
	mac newMapMetatiles
index set 0
	repeat 8
	setRecentMetatile index
index set index + 1
	repend
	endm

	mac mapMetatileRow
	endm