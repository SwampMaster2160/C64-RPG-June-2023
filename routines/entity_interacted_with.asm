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

do_not_block_amulet_giver_interacted_with subroutine
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_GOT_DO_NOT_BLOCK_AMULET/8]
	and #1<<(PLOT_COMPLETION_FLAG_GOT_DO_NOT_BLOCK_AMULET%8)
	bne .amulet_already_got
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_GOT_DO_NOT_BLOCK_AMULET/8]
	ora #1<<(PLOT_COMPLETION_FLAG_GOT_DO_NOT_BLOCK_AMULET%8)
	sta plot_completion_flags+[PLOT_COMPLETION_FLAG_GOT_DO_NOT_BLOCK_AMULET/8]
	lda #<get_do_not_block_amulet_script
	sta script_address
	lda #>get_do_not_block_amulet_script
	sta script_address+1
	jsr execute_script
	rts
.amulet_already_got
	lda #<do_not_block_amulet_already_got_script
	sta script_address
	lda #>do_not_block_amulet_already_got_script
	sta script_address+1
	jsr execute_script
	rts

beach_blocker_interacted_with subroutine
	lda #<beach_blocker_script
	sta script_address
	lda #>beach_blocker_script
	sta script_address+1
	jsr execute_script
	rts