; x: The entity starting the interaction
; y: The entity being interacted with

blank_entity_interacted_with subroutine
	rts

dummy_entity_interacted_with subroutine
	;lda #SUSPENDED_SCRIPT_RESUME_ON_TICK
	;sta suspended_script_address
	lda #<test_entity_script
	sta script_address
	lda #>test_entity_script
	sta script_address+1
	jsr execute_script
	rts

gem_entity_interacted_with subroutine
	rts