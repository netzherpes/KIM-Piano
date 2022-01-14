;***************************************
;* KIM Piano                           *
;* (c) by Peter Engels  1979           *
;*                                     *
;* plays whole notes from C to D       *
;* by pressing the buttons 0-F.        *
;*                                     *
;***************************************
         .setcpu "6502"
         .org    $0200
Start:   cld
         jsr     $1f40
         jsr     $1f6a
         cmp     #$15       ;button pushed? 15=no
         beq     Start
         tax
         lda     notes,x
         sta     $1705      ;load note to timer
loop:    bit     $1707
         bpl     loop
         lda     #$01
         sta     $1701
         inc     $1700
         jmp     Start

notes:   .byte   $d5
         .byte   $b9
         .byte   $9e
         .byte   $95
         .byte   $80
         .byte   $6c
         .byte   $5e
         .byte   $55
         .byte   $47
         .byte   $3a
         .byte   $34
         .byte   $29
         .byte   $1f
         .byte   $16
         .byte   $12
