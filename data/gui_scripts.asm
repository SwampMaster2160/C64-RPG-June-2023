; Draw a textbox for printing text, change the text color to white and set the text cursor to the upper left of the boxes inside.
draw_basic_textbox_script subroutine
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(20*40), <(20*40)
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_WHITE
	byte SCRIPT_DRAW_TEXTBOX, 40, 5
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(21*40+1), <(21*40+1)
	byte SCRIPT_END

draw_enter_fire_script subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_WHITE
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(24*40+1), <(24*40+1)
	byte "Press Enter/Fire"
	byte SCRIPT_END

draw_hud_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
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

saphire_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_BLUE
	byte "Saphire"
	byte SCRIPT_END

ruby_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_RED
	byte "Ruby"
	byte SCRIPT_END

emerald_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_GREEN
	byte "Emerald"
	byte SCRIPT_END

amethyst_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_MAGENTA
	byte "Amethyst"
	byte SCRIPT_END

topaz_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_ORANGE
	byte "Topaz"
	byte SCRIPT_END

quartz_text subroutine
	byte "Quartz"
	byte SCRIPT_END

legrandite_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_YELLOW
	byte "Legrandite"
	byte SCRIPT_END

diamond_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_CYAN
	byte "Diamond"
	byte SCRIPT_END

gate_key_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_YELLOW
	byte "Gate Key"
	byte SCRIPT_END

shovel_text subroutine
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_LIGHT_GREY
	byte "Shovel"
	byte SCRIPT_END

test_entity_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "I am a test entity."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

found_gem_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Found the "
	byte SCRIPT_CALL_INDIRECT, <word_0, >word_0
	byte SCRIPT_CHANGE_TEXT_COLOR, C64_COLOR_WHITE
	byte "."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

get_do_not_block_amulet_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "I have this amulet that stops people"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "from randomly blocking a path for no"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(23*40+1), <(23*40+1)
	byte "reason.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Got the do not block amulet."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

do_not_block_amulet_already_got_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "I hope the amulet helps.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

beach_blocker_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "I'm just blocking this beach for no"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "reason.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

gate_opened_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Used the key to open the gate."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

fallen_tree_cleared_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Used the axe to clear the fallen tree."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

bridge_repaired_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Repaired the bridge."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

tree_chopped_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Used the axe to chop the tree."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

river_shallowed_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Used the shovel to make the river more"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "shallow and crossable."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

river_no_shovel_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "The river is deep but could be made"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "shallow."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

fallen_tree_no_axe_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "A fallen tree is blocking the path."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

no_bridge_repair_kit_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "The bridge has collapsed."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

choppable_tree_no_axe_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "A tree is blocking the path, it can"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "easily be chopped with a good axe."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

gate_no_key_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "This gate needs a key."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

get_weak_axe_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "I have an old axe that I no longer"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "need.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Got the weak axe."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "It is only strong enough to clear"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "fallen, rotten trees.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

get_axe_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "I have an another axe that I no"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "longer need.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Got the axe."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "It is stronger than the last axe I"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "gave you.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

get_bridge_repair_kit_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "I have a kit to repair a bridge.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte "Got the bridge repair kit."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "It's useful for repairing collapsed"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "bridges.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

toolsmith_no_item_handed_out_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "I hope that helps.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

path_damaged_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "This path is damaged and needs to be"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "repaired.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

gem_person_no_gems_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "You must adventure out an collect the"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "8 gems and return or the world will"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(23*40+1), <(23*40+1)
	byte "end or some trash.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END

gem_person_all_gems_script subroutine
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "All the gems have been collected so"
	byte SCRIPT_CHANGE_TEXT_CURSOR_POINTER+>(22*40+1), <(22*40+1)
	byte "the world won't end now."
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_basic_textbox_script, #>draw_basic_textbox_script
	byte '", "This game is complete now.", '"
	byte SCRIPT_CALL, #<draw_enter_fire_script, #>draw_enter_fire_script
	byte SCRIPT_SUSPEND_UNTILL_ACTION_KEY_PRESSED
	byte SCRIPT_CALL, #<draw_hud_script, #>draw_hud_script
	byte SCRIPT_END