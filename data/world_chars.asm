; World chars
world_chars subroutine
	byte $00, $00, $00, $00, $00, $00, $00, $00                                                         ; Blank
	byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF                                                         ; Full
	byte #%10101010, #%01010101, #%10101010, #%01010101, #%10101010, #%01010101, #%10101010, #%01010101 ; Dither