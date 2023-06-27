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
	; Setup processor port (RAM layout and datasette control)
	lda #%00101111
	sta _6510_processor_port_bit_directions
	lda #%00100101
	sta _6510_processor_port_out_bits
	; Setup VIC-II
	lda #(3 | C64_25_ROWS | C64_SCREEN_ON) ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #0                                 ; Interrupt at line 0
	sta c64_screen_interrupt_line
	lda #(0 | C64_40_COLUMNS)              ; No horizontal scroll, 40 columns, multicolor off
	sta c64_screen_control_1
	lda #0                                 ; Disable sprites
	sta c64_sprite_enables
	lda #(2 << 1) | (1 << 4)               ; Tile shapes at $1000, tile selections at $0400
	sta c64_vic_memory_layout
	lda #1                                 ; Interrupt only when a set scanline is reached
	sta c64_vic_interrupt_control
	lda #0                                 ; Disable sprites
	sta c64_sprite_enables
	lda #$FF                               ; Acknowledge any outstanding VIC-II interrupts
	sta c64_vic_interrupt_status
	; CIA chips
	lda #$7F                               ; Disable interrupts from CIA chips
	sta $DC0D
	sta $DD0D
	lda $DC0D                              ; Acknowledge any outstanding CIA interrupts
	lda $DD0D
	; Set interrupt handler
	lda #<irq
	sta $FFFE
	lda #>irq
	sta $FFFF
	; Loop untill interrupt
	cli
.loop
	jmp .loop

irq subroutine
	; Disable interrupts and push a, x and y to onto the stack
	sei
	pha
	txa
	pha
	tya
	pha
	; Acknowledge interrupt
	lda #$FF
	sta c64_vic_interrupt_status

	inc $0400
	inc c64_border_color
	; Pull a, x and y from the stack and return from interrupt
	pla
	tay
	pla
	tax
	pla
	cli
	rti