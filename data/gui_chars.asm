; GUI chars
gui_chars subroutine
	byte 0, 0, 0, 0, 0, 0, 0, 0                 ; Space
	byte 24, 24, 24, 24, 0, 0, 24, 0            ; !
	byte 102, 102, 102, 0, 0, 0, 0, 0           ; "
	byte 102, 102, 255, 102, 255, 102, 102, 0   ; #
	byte 24, 60, 96 ,60 ,6 ,60 ,24 ,0           ; $
	byte 98, 102, 12, 24, 48, 102, 70, 0        ; %
	byte 60, 102, 60, 56, 110, 108, 62, 0       ; &
	byte 24, 24, 24, 0, 0, 0, 0, 0              ; '
	byte 12, 24, 48, 48, 48, 24, 12, 0          ; (
	byte 48, 24, 12, 12, 12, 24, 48, 0          ; )
	byte 0, 102, 60, 126, 60, 102, 0, 0         ; *
	byte 0, 24, 24, 126, 24, 24, 0, 0           ; +
	byte 0, 0, 0, 0, 0, 24, 24, 48              ; , 
	byte 0, 0, 0, 126, 0, 0, 0, 0               ; -
	byte 0, 0, 0, 0, 0, 24, 24, 0               ; .
	byte 2, 6, 12, 24, 48, 96, 64, 0            ; /
	byte 60, 102, 110, 118, 102, 102, 60, 0     ; 0
	byte 24, 56, 24, 24, 24, 24, 126, 0         ; 1
	byte 60, 102, 6, 12, 24, 48, 126, 0         ; 2
	byte 60, 102, 6, 28, 6, 102, 60, 0          ; 3
	byte 30, 54, 102, 126, 6, 6, 6, 0           ; 4
	byte 126, 96, 96, 124, 6, 102, 60, 0        ; 5
	byte 60, 102, 96, 124, 102, 102, 60, 0      ; 6
	byte 126, 102, 12, 24, 24, 24, 24, 0        ; 7
	byte 60, 102, 102, 60, 102, 102, 60, 0      ; 8
	byte 60, 102, 102, 62, 6, 102, 60, 0        ; 9
	byte 0, 24, 24, 0, 0, 24, 24, 0             ; :
	byte 0, 24, 24, 0, 0, 24, 24, 48            ; ;
	byte 12, 24, 48, 96, 48, 24, 12, 0          ; <
	byte 0, 0, 126, 0, 126, 0, 0, 0             ; =
	byte 48, 24, 12, 6, 12, 24, 48, 0           ; >
	byte 60, 102, 12, 24, 0, 24, 24, 0          ; ?
	byte 60, 102, 102, 110, 96, 102, 60, 0      ; @
	byte 60, 102, 102, 126, 102, 102, 102, 0    ; A
	byte 124, 102, 102, 124, 102, 102, 124, 0   ; B
	byte 60, 102, 96, 96, 96, 102, 60, 0        ; C
	byte 124, 102, 102, 102, 102, 102, 124, 0   ; D
	byte 126, 96, 96, 124, 96, 96, 126, 0       ; E
	byte 126, 96, 96, 124, 96, 96, 96, 0        ; F
	byte 60, 102, 96, 110, 102, 102, 60, 0      ; G
	byte 102, 102, 102, 126, 102, 102, 102, 0   ; H
	byte 126, 24, 24, 24, 24, 24, 126, 0        ; I
	byte 126, 12, 12, 12, 12, 108, 56, 0        ; J
	byte 102, 108, 120, 112, 120, 108, 102, 0   ; K
	byte 96, 96, 96, 96, 96, 96, 126, 0         ; L
	byte 102, 126, 102, 102, 102, 102, 102, 0   ; M
	byte 102, 102, 118, 126, 110, 102, 102, 0   ; N
	byte 60, 102, 102, 102, 102, 102, 60, 0     ; 0
	byte 124, 102, 102, 124, 96, 96, 96, 0      ; P
	byte 60, 102, 102, 102, 102, 110, 62, 0     ; Q
	byte 124, 102, 102, 124, 102, 102, 102, 0   ; R
	byte 60, 102, 96, 60, 6, 102, 60, 0         ; S
	byte 126, 24, 24, 24, 24, 24, 24, 0         ; T
	byte 102, 102, 102, 102, 102, 102, 60, 0    ; U
	byte 102, 102, 102, 60, 60, 24, 24, 0       ; V
	byte 102, 102, 102, 102, 102, 126, 102, 0   ; W
	byte 102, 102, 60, 24, 60, 102, 102, 0      ; X
	byte 102, 102, 60, 24, 24, 24, 24, 0        ; Y
	byte 126, 6, 12, 24, 48, 96, 126, 0         ; Z
	byte 30, 24, 24, 24, 24, 24, 30, 0          ; [
	byte 64, 96, 48, 24, 12, 6, 2, 0            ; \
	byte 120, 24, 24, 24, 24, 24, 120, 0        ; ]
	byte 24, 60, 102, 0, 0, 0, 0, 0             ; ^
	byte 0, 0, 0, 0, 0, 0, 126, 0               ; _
	byte 24, 24, 12, 0, 0, 0, 0, 0              ; `
	byte 0, 0, 60, 6, 62, 102, 62, 0            ; a
	byte 96, 96, 124, 102, 102, 102, 124, 0     ; b
	byte 0, 0, 60, 102, 96, 102, 60, 0          ; c
	byte 6, 6, 62, 102, 102, 102, 62, 0         ; d
	byte 0, 0, 60, 102, 124, 96, 60, 0          ; e
	byte 14, 24, 28, 24, 24, 24, 24, 0          ; f
	byte 0, 0, 60, 102, 102, 62, 6, 60          ; g
	byte 96, 96, 124, 102, 102, 102, 102, 0     ; h
	byte 24, 0, 24, 24, 24, 24, 24, 0           ; i
	byte 12, 0, 12, 12, 12, 108, 56, 0          ; j
	byte 96, 96, 102, 108, 120, 108, 102, 0     ; k
	byte 24, 24, 24, 24, 24, 24, 12, 0          ; l
	byte 0, 0, 102, 126, 102, 102, 102, 0       ; m
	byte 0, 0, 124, 102, 102, 102, 102, 0       ; n
	byte 0, 0, 60, 102, 102, 102, 60, 0         ; o
	byte 0, 0, 124, 102, 102, 124, 96, 96       ; p
	byte 0, 0, 62, 102, 102, 62, 6, 6           ; q
	byte 0, 0, 60, 96, 96, 96, 96, 0            ; r
	byte 0, 0, 60, 96, 60, 6, 60, 0             ; s
	byte 24, 24, 126, 24, 24, 24, 12, 0         ; t
	byte 0, 0, 102, 102, 102, 102, 62, 0        ; u
	byte 0, 0, 102, 102, 60, 60, 24, 0          ; v
	byte 0, 0, 102, 102, 102, 126, 102, 0       ; w
	byte 0, 0, 102, 60, 24, 60, 102, 0          ; x
	byte 0, 0, 102, 102, 102, 62, 6, 60         ; y
	byte 0, 0, 126, 12, 24, 48, 126, 0          ; z
	byte 12, 24, 16, 48, 16, 24, 12, 0          ; {
	byte 24, 24, 24, 24, 24, 24, 24, 0          ; |
	byte 48, 24, 8, 12, 8, 24, 48, 0            ; }
	byte 0, 0, 0, 59, 110, 0, 0, 0              ; ~
	byte $00, $00, $00, $00, $00, $00, $00, $00 ; Del
	; Borders / Lines
	byte   0,  0,  0, 24,  24,   0,  0,  0
	byte  24, 24, 24, 24,  24,   0,  0,  0
	byte   0,  0,  0, 31,  31,   0,  0,  0
	byte  24, 24, 28, 31,  15,   0,  0,  0
	byte   0,  0,  0, 24,  24,  24, 24, 24
	byte  24, 24, 24, 24,  24,  24, 24, 24
	byte   0,  0,  0, 15,  31,  28, 24, 24
	byte  24, 24, 28, 31,  31,  28, 24, 24
	byte   0,  0,  0, 248, 248,  0,  0,  0
	byte  24, 24, 56, 248, 240,  0,  0,  0
	byte   0,  0,  0, 255, 255,  0,  0,  0
	byte  24, 24, 60, 255, 255,  0,  0,  0
	byte   0,  0,  0, 240, 248, 56, 24, 24
	byte  24, 24, 56, 248, 248, 56, 24, 24
	byte   0,  0,  0, 255, 255, 60, 24, 24
	byte  24, 24, 60, 255, 255, 60, 24, 24
	; Icons
	byte 126, 60, 60, 126, 24, 24, 24, 0 ; Location Pin