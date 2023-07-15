; Draws a 2x2 char tile on screen
; --- Inputs ---
; a:                 The tile ID to draw
; x:                 The drawing offset
; sta_x_modable_0+1: The address of the top left char on the screen that should be drawn over
; sta_x_modable_1+1: The address of the top left char's color on the screen that should be drawn over
; --- Corrupted ---
; y, lda_y_modable_0+1
; --- Outputs ---
; x: Has 41 added
draw_tile subroutine
	; Get location of where the tile should be copied from (tiles + a * 8)
	tay
	; Low byte
	asl
	asl
	asl
	clc
	adc #<tiles
	php
	sta lda_y_modable_0+1
	; High byte
	tya
	ror
	ror
	ror
	and #%00000111
	plp
	adc #>tiles
	sta lda_y_modable_0+2
	; Copy chars to screen
	ldy #0
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	; Next row
	iny
	txa
	clc
	adc #39
	tax
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	; Copy colors to screen
	iny
	txa
	sec
	sbc #41
	tax
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	; Next row
	iny
	txa
	clc
	adc #39
	tax
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	; Return nothing
	rts

; Draws a 4x4 char metatile on screen
; --- Inputs ---
; a:                 The metatile ID to draw
; x:                 The drawing offset
; sta_x_modable_0+1: The address of the top left char on the screen that should be drawn over
; sta_x_modable_1+1: The address of the top left char's color on the screen that should be drawn over
; --- Corrupted ---
; y, lda_y_modable_0+1
; --- Outputs ---
; x: Has 123 added
draw_metatile subroutine
	; Get location to copy metatile from (metatiles + a * 4)
	tay
	; Low byte
	asl
	asl
	clc
	adc #<metatiles
	php
	sta lda_y_modable_0+1
	; High byte
	tya
	ror
	ror
	and #%00000011
	plp
	adc #>metatiles
	sta lda_y_modable_0+2
	; Get tiles
	ldy #3
	jsr lda_y_modable_0
	pha
	dey
	jsr lda_y_modable_0
	pha
	dey
	jsr lda_y_modable_0
	pha
	dey
	jsr lda_y_modable_0
	; Draw tiles
	jsr draw_tile
	txa
	sec
	sbc #39
	tax
	pla
	jsr draw_tile
	txa
	clc
	adc #37
	tax
	pla
	jsr draw_tile
	txa
	sec
	sbc #39
	tax
	pla
	jsr draw_tile
	; Return
	rts

; Draws a map
; --- Inputs ---
; a: The map ID to draw
; --- Corrupted ---
; y, lda_y_modable_0+1, lda_y_modable_1+1, sta_x_modable_0+1, sta_x_modable_1+1
draw_map subroutine
	; Get the location that we should copy the map from (maps + a * 64)
	tay
	; Low byte
	asl
	asl
	asl
	asl
	asl
	asl
	clc
	adc #<maps
	php
	sta lda_y_modable_1+1
	; High byte
	tya
	lsr
	lsr
	plp
	adc #>maps
	sta lda_y_modable_1+2
	; Get the locations of the chars and colors that we should copy to for the first row
	lda #<$0400
	sta sta_x_modable_0+1
	lda #>$0400
	sta sta_x_modable_0+2
	lda #<c64_tile_colors
	sta sta_x_modable_1+1
	lda #>c64_tile_colors
	sta sta_x_modable_1+2
	; Set the index into the metatiles of the map to 0
	ldy #0
; At the start or each time we finnish drawing a row of metatiles
.rows_loop
	; Set the amount of metatiles we have drawn this row to 0
	lda #0
	sta byte_0
	; Set char offset to 0
	ldx #0
.row_loop
	; Draw metatile
	tya
	pha
	jsr lda_y_modable_1
	jsr draw_metatile
	pla
	tay
	; Set char offset for the next metatile
	txa
	sec
	sbc #119
	tax
	; Increment the index into the maps metatiles
	iny
	; If we have copied 50 tiles then return from the subroutine
	cpy #50
	beq .end
	; Increment the amount of metatiles that have been drawn this row
	lda byte_0
	clc
	adc #1
	sta byte_0
	; If we have drawn less than 10 tiles this row then continue on to draw the next char
	cmp #10
	bne .row_loop
	; If we have drawn 10 tiles then move the screen char and color pointers to point one metatile down
	lda sta_x_modable_0+1
	clc
	adc #160
	sta sta_x_modable_0+1
	lda sta_x_modable_0+2
	adc #0
	sta sta_x_modable_0+2
	lda sta_x_modable_1+1
	clc
	adc #160
	sta sta_x_modable_1+1
	lda sta_x_modable_1+2
	adc #0
	sta sta_x_modable_1+2
	; Continue on to draw next row
	jmp .rows_loop
; At the end return nothing
.end
	rts

; Fills screen with tile 0 colored white
clear_screen subroutine
	; Clear the first 3 pages of the screen
	ldx #$00
.loop
	lda #$0
	sta $0400,x
	sta $0500,x
	sta $0600,x
	lda #C64_COLOR_WHITE
	sta c64_tile_colors,x
	sta c64_tile_colors+$100,x
	sta c64_tile_colors+$200,x
	inx
	bne .loop
	; Clear the last partial page of the screen such that a total of 1000 chars will have been cleared
	ldx #$0
.last_loop
	lda #$0
	sta $0700,x
	lda #C64_COLOR_WHITE
	sta c64_tile_colors+$300,x
	inx
	cpx #<1000
	bne .last_loop
	rts

; Display all 256 chars in the top left as a 16x16 box
display_all_chars subroutine
	; Load $0400 into sta_x_modable's address
	lda #$00
	sta sta_x_modable_0+1
	lda #$04
	sta sta_x_modable_0+2
	; Start with tile 0
	ldx #0
.loop
	; Draw tile
	txa
	jsr sta_x_modable_0
	; Increment tile count
	inx
	; Check if we should go to the next row (if the tile id is a multiple of 16)
	txa
	and #%00001111 ; a %= 16
	bne .skip_next_row
	; If so add (40-16) to sta_x_modable's address
	lda sta_x_modable_0+1
	clc
	adc #(40-16)
	sta sta_x_modable_0+1
	lda sta_x_modable_0+2
	adc #0
	sta sta_x_modable_0+2
	; If not then we will skip to here
.skip_next_row
	; If the tile number overflows to 0 then we have drawn all tiles so return
	txa
	bne .loop
	rts