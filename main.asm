	processor 6502
	include "c64_hardware.asm"

; ----- Zeropage vars -----
	seg.u zeropage
* = 0
; ----- Zeropage vars -----

byte_a ds 1

; ----- .PRG File header -----
	seg file_header
* = $07FF
; ----- .PRG File header -----

	word file_content ; A pointer to where the program should be loaded to

; ----- Code loaded from disk -----
	seg code
* = $0801
; ----- Code loaded from disk -----

file_content subroutine
; BASIC program that runs when "RUN" is entered into the BASIC command line, jumps to "init" subroutine in machine code mode.
basic_program subroutine
.line_0
	word .end_line      ; Pointer to next line (end line)
	word 0              ; Line number
	byte $9E, "2061", 0 ; "SYS 2061" in bytecode, null terminated
.end_line
	word 0              ; Null pointer to next line (end line)

; BASIC program will jump here, BASIC is no longer required now.
init subroutine
	sei
.loop
	inc $0400
	jmp .loop