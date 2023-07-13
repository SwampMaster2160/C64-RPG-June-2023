irq subroutine
	; Disable interrupts and push a, x and y to onto the stack
	pha
	txa
	pha
	tya
	pha
	; Acknowledge interrupt
	lda #$FF
	sta c64_vic_interrupt_status

	inc c64_border_color
	; Pull a, x and y from stack
	pla
	tay
	pla
	tax
	pla
	rti