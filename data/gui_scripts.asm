draw_hud subroutine
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(20*40), <(20*40)
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_WHITE
	byte SCRIPT_DRAW_TEXTBOX, 40, 5
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(21*40+1), <(21*40+1)
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_RED
	byte GUI_CHAR_LOCATION_PIN
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_WHITE
	byte SCRIPT_CALL_INDIRECT, #<map_name_address, #>map_name_address
	byte SCRIPT_END

newtown_name subroutine
	byte "Newtown"
	byte SCRIPT_END

midland_path_name subroutine
	byte "Midland Path"
	byte SCRIPT_END

two_islands_path_name subroutine
	byte "Two Islands Path"
	byte SCRIPT_END

bayswater_beach_name subroutine
	byte "Bayswater Beach"
	byte SCRIPT_END

warf_path_name subroutine
	byte "Warf Path"
	byte SCRIPT_END

little_lake_name subroutine
	byte "Little Lake"
	byte SCRIPT_END

bayswater_peninsula_name subroutine
	byte "Bayswater Peninsula"
	byte SCRIPT_END

twin_warfs_name subroutine
	byte "Twin Warfs"
	byte SCRIPT_END

tunnel_path_name subroutine
	byte "Tunnel Path"
	byte SCRIPT_END

tanuki_tunnel_name subroutine
	byte "Tanuki Tunnel"
	byte SCRIPT_END

commie_path_name subroutine
	byte "Commie Path"
	byte SCRIPT_END

grand_lake_name subroutine
	byte "Grand Lake"
	byte SCRIPT_END

riverside_path_name subroutine
	byte "Riverside Path"
	byte SCRIPT_END

lenin_lake_name subroutine
	byte "Lenin Lake"
	byte SCRIPT_END

marx_beach_name subroutine
	byte "Marx Beach"
	byte SCRIPT_END

longtown_name subroutine
	byte "Longtown"
	byte SCRIPT_END

citytonberg_name subroutine
	byte "Citytonberg"
	byte SCRIPT_END

widewater_river_name subroutine
	byte "Widewater River"
	byte SCRIPT_END

l_warf_name subroutine
	byte "L Warf"
	byte SCRIPT_END

moston_name subroutine
	byte "Moston"
	byte SCRIPT_END

berton_name subroutine
	byte "Berton"
	byte SCRIPT_END

delta_beach_name subroutine
	byte "Delta Beach"
	byte SCRIPT_END

north_warf_name subroutine
	byte "North Warf"
	byte SCRIPT_END

vegans_on_fish_path_name subroutine
	byte "Vegans on Fish Path"
	byte SCRIPT_END

mountianpass_path_name subroutine
	byte "Mountianpass Path"
	byte SCRIPT_END

mountianberg_name subroutine
	byte "Mountianberg"
	byte SCRIPT_END

northpond_name subroutine
	byte "Northpond"
	byte SCRIPT_END

bayview_name subroutine
	byte "Bayview"
	byte SCRIPT_END

beachside_path_name subroutine
	byte "Beachside Path"
	byte SCRIPT_END

money_beach_name subroutine
	byte "Money Beach"
	byte SCRIPT_END

step_beach_name subroutine
	byte "Step Beach"
	byte SCRIPT_END

two_islands_bridge_name subroutine
	byte "Two Islands Bridge"
	byte SCRIPT_END

two_islands_beach_name subroutine
	byte "Two Islands Beach"
	byte SCRIPT_END

two_islands_town_name subroutine
	byte "Two Islands Town"
	byte SCRIPT_END

hillbase_name subroutine
	byte "Hillbase"
	byte SCRIPT_END

raccoon_path_name subroutine
	byte "Raccoon Path"
blank_string subroutine
	byte SCRIPT_END