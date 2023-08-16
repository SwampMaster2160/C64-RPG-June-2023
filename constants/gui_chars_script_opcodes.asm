	newEnum
	enumVariant SCRIPT_END                                 ; End of script
	enumVariant SCRIPT_CALL_INDIRECT_MACHINE_SUBROUTINE    ; Call a subroutine written in machine code
	enumVariant SCRIPT_DRAW_TEXTBOX                        ; Draw a text box
	enumVariant SCRIPT_CHANGE_TEXT_COLOR                   ; Change text color
	enumVariant SCRIPT_CHANGE_TEXT_CURSOR_POINTER          ; Change the text cursor pointer
	enumFrom SCRIPT_CHANGE_TEXT_CURSOR_POINTER+4
	enumVariant SCRIPT_CALL_INDIRECT                       ; Call another script that has it's address at an address
	enumVariant SCRIPT_SPAWN_ENTITY                        ; Spawn an entity
	enumVariant SCRIPT_SPAWN_TILE_EVENT                    ; Spawn a tile event

; GUI Chars
	enumFrom $80
	enumVariant GUI_CHAR_LINE_NONE
	enumVariant GUI_CHAR_LINE_UP
	enumVariant GUI_CHAR_LINE_RIGHT
	enumVariant GUI_CHAR_LINE_UP_RIGHT
	enumVariant GUI_CHAR_LINE_DOWN
	enumVariant GUI_CHAR_LINE_VERTICAL
	enumVariant GUI_CHAR_LINE_RIGHT_DOWN
	enumVariant GUI_CHAR_LINE_VERTICAL_RIGHT
	enumVariant GUI_CHAR_LINE_LEFT
	enumVariant GUI_CHAR_LINE_UP_LEFT
	enumVariant GUI_CHAR_LINE_HORIZONTAL
	enumVariant GUI_CHAR_LINE_UP_HORIZONTAL
	enumVariant GUI_CHAR_LINE_DOWN_LEFT
	enumVariant GUI_CHAR_LINE_VERTICAL_LEFT
	enumVariant GUI_CHAR_LINE_HORIZONTAL_DOWN
	enumVariant GUI_CHAR_LINE_CROSS

	enumVariant GUI_CHAR_LOCATION_PIN