; x: The entity starting the interaction
; y: The entity being interacted with

blank_entity_interacted_with subroutine
	rts

dummy_entity_interacted_with subroutine
	lda #<test_entity_script
	sta script_address
	lda #>test_entity_script
	sta script_address+1
	jsr execute_script
	rts

gem_entity_interacted_with subroutine
	txa
	pha
	tya
	pha
	lda entity_discriminants,y
	sec
	sbc #ENTITY_SAPHIRE
	pha
	jsr set_plot_completion_flag
	pla
	asl
	tay
	lda gem_names,y
	sta word_0
	lda gem_names+1,y
	sta word_0+1
	pla
	tay
	lda #ENTITY_NONE
	sta entity_discriminants,y
	lda #<found_gem_script
	sta script_address
	lda #>found_gem_script
	sta script_address+1
	jsr execute_script
	pla
	tax
	rts