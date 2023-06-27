	processor 6502
	include "c64_hardware.asm"

; ----- Zeropage vars -----
	seg.u zeropage
* = 0
; ----- Zeropage vars -----

byte_a ds 1

; ----- ROM Code -----
	seg rom
* = $8000
; ----- ROM Code -----

; ROM header
	word reset                   ; Reset routine
	word reset                   ; NMI routine
	byte $C3, $C2, $CD, $38, $30 ; Magic bytes "CBM80" in PETSCII

reset subroutine
	sei
	; Setup processor port (RAM layout and datasette control)
	lda #%00100111
	sta _6510_processor_port_out_bits
	; Setup VIC-II
	lda #(3 | C64_25_ROWS | C64_SCREEN_ON) ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #0
	lda #1
	sta c64_vic_interrupt_control
	lda #0
	sta $DC0D
	sta $DD0D
	sta c64_screen_interrupt_line
	lda #(0 | C64_40_COLUMNS)              ; No horizontal scroll, 40 columns, multicolor off
	sta c64_screen_control_1
	lda #0                                 ; Disable sprites
	sta c64_sprite_enables
	lda #(2 << 1) | (1 << 4)               ; Tile shapes at $1000, tile selections at $0400
	sta c64_vic_memory_layout

	lda #C64_COLOR_WHITE
	sta c64_border_color
	lda #C64_COLOR_BLACK
	sta c64_background_colors
	lda #C64_COLOR_WHITE
	sta c64_tile_colors

	;lda #<irq
	;sta $FFFE
	;lda #>irq
	;sta $FFFF

	lda #<irq
	sta $0316
	sta $0318
	lda #>irq
	sta $0317
	sta $0319

	cli
.loop
	;inc $0400
	jmp .loop

irq subroutine
	sei
	lda #$FF
	sta c64_vic_interrupt_status
	inc $0400
	pla
	tay
	pla
	tax
	pla
	cli
	rti

; ----- Pad file to 16KiB -----
* = $BFFF
	byte $FF