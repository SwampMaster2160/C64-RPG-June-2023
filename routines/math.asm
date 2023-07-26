; Calculates a new random byte
; --- Inputs ---
; last_rng: The seed for the algorithm
; --- Outputs ---
; a:        The random number generated (last_rng * 5 + 1)
; last_rng: Also the random number generated
generate_random subroutine
	; Calculate last_rng * 5 + 1
	lda last_rng
	asl
	asl
	clc
	adc last_rng
	clc
	adc #1
	; Store back in last_rng
	sta last_rng
	; Return the number generated
	rts

; Sets lda_y_modable_1_address to point to the data for the current map
; --- Inputs ---
; current_map: The map to point to
; --- Outputs ---
; lda_y_modable_1_address: The map data pointer (maps + current_map * 64)
; --- Corrupted ---
; a
load_map_data_pointer subroutine
	; Low byte
	lda current_map
	asl
	asl
	asl
	asl
	asl
	asl
	clc
	adc #<maps
	php
	sta lda_y_modable_1_address
	; High byte
	lda current_map
	lsr
	lsr
	plp
	adc #>maps
	sta lda_y_modable_1_address+1
	; Return
	rts

; Sets lda_y_modable_0_address to point to the data for the metatile
; --- Inputs ---
; a: The metatile whos data we should point to
; --- Outputs ---
; lda_y_modable_0_address: The metatile data pointer (metatiles + a * 4)
; --- Corrupted ---
; a
load_metatile_data_pointer subroutine
	tay
	; Low byte
	asl
	asl
	clc
	adc #<metatiles
	php
	sta lda_y_modable_0_address
	; High byte
	tya
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>metatiles
	sta lda_y_modable_0_address+1
	; Return
	rts