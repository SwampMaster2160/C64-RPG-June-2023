	processor 6502

; Include code that is not directly assembled into bytes
	include "macros/mod.asm"
	include "constants/mod.asm"
	include "variables/mod.asm"

; The header of the file, this does not get loaded into memory
	seg file_header
* = $07FF
	word basic_program ; A pointer to where the program should be loaded to

; What does get loaded into memory
	seg code
* = $0801

; BASIC program that runs when "RUN" is entered into the BASIC command line, jumps to "init" subroutine in machine code mode.
; A BASIC program consists of a singily linked list where each node contains:
; A pointer to the next line node
; A line number
; BASIC bytecode for the line.
basic_program subroutine
.line_0
	word .end_line      ; Pointer to next line (end line)
	word 0              ; Line number
	byte $9E, "2061", 0 ; "SYS 2061" in bytecode, null terminated, this will jump to our init asm code
.end_line
	word 0              ; Null pointer to next line (end line)

; All of the code that gets assembled into bytes
	include "routines/init.asm"
	include "routines/interrupt.asm"
	include "routines/math.asm"
	include "routines/draw.asm"
	include "routines/io.asm"
	include "routines/world.asm"
	include "routines/entity_tick.asm"
	include "routines/script.asm"

	include "data/tiles.asm"
	include "data/metatiles.asm"
	include "data/maps.asm"
	include "data/entities.asm"
	include "data/entity_sprites.asm"
	include "data/map_feature_scripts.asm"
	include "data/gui_scripts.asm"

* = $2000
	include "data/world_chars.asm"
* = $2800
	include "data/gui_chars.asm"