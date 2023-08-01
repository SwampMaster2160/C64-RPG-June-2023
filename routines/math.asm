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

; Sets word_1 to point to the data for the current map
; --- Inputs ---
; current_map: The map to point to
; --- Outputs ---
; word_1: The map data pointer (maps + current_map * 64)
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
	sta word_1
	; High byte
	lda current_map
	lsr
	lsr
	plp
	adc #>maps
	sta word_1+1
	; Return
	rts

; Sets word_0 to point to the data for the metatile
; --- Inputs ---
; a: The metatile whos data we should point to
; --- Outputs ---
; word_0: The metatile data pointer (metatiles + a * 4)
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
	sta word_0
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
	sta word_0+1
	; Return
	rts

; Sets word_0 to point to the data for the tile
; --- Inputs ---
; a: The tile whos data we should point to
; --- Outputs ---
; word_0: The tile data pointer (tiles + a * 8)
; --- Corrupted ---
; a, byte_1
load_tile_data_pointer subroutine
	sta byte_1
	; Low byte
	asl
	asl
	asl
	clc
	adc #<tiles
	php
	sta word_0
	; High byte
	lda byte_1
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>tiles
	sta word_0+1
	; Return
	rts

sta_x_modable_0 subroutine
	byte $9D, 0, 0
	rts

sta_x_modable_1 subroutine
	byte $9D, 0, 0
	rts