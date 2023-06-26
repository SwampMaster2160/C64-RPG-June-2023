	processor 6502
	SEG code
* = $8000
	word reset
	word 0
	byte $C3, $C2, $CD, $38, $30
reset SUBROUTINE
	sei
	; Set screen as output device
	lda #$03
	sta $9A
	; Set keybord as input device
	lda #$00
	sta $99

	ldx #$12
.a
	lda $ECC8,x
	sta $D00F,x
	dex
	bne .a

.loop
	inc $0400
	jmp .loop
* = $BFFF
	byte $FF