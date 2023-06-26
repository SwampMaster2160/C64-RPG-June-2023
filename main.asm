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
	;lda #%00101111
	;sta _6510_processor_port_bit_directions
	;lda #%00100101
	;sta _6510_processor_port_out_bits
	;lda #%00101111
	;sta 0;_6510_processor_port_bit_directions
	;sta 2
	;lda #$35
	;sta 1
	;sta 1
	;sta 1
	;LDA #$36
	;STA $01
	;byte $85, $01
	;sta 1
	;sta 2
	;sta 3
	;sta 4
	;sta 5
	; Setup VIC-II
	lda #3 | C64_25_ROWS | C64_SCREEN_ON ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #0 | C64_40_COLUMNS              ; No horizontal scroll, 40 columns, multicolor off
	sta c64_screen_control_1
	lda #0                               ; Disable sprites
	sta c64_sprite_enables
	lda #(2 << 1) | (1 << 4)             ; Tile shapes at $1000, tile selections at $0400
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

	cli
.loop
	inc $0400
	jmp .loop

irq subroutine
	sei
	inc $0400
	cli
	rti

; ----- Pad file to 16KiB -----
* = $BFFF
	byte $FF