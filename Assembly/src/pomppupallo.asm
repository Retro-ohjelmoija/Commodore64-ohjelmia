; Reunoista pomppaava pallo

*=$C000

START   JSR CLSCR
LOOPPI  JSR LASKE
        JSR VANHAP
        JSR UUSIPA
        
; Pallo liikkuu niin nopeasti,
; että ilman viivettä liikettä ei näe
        LDX #0
        LDY #8
VIIVE   NOP
        INX
        BNE VIIVE
        DEY
        BNE VIIVE


        JMP LOOPPI
EXIT    RTS


; ** Vanha pallo pois **
VANHAP
        ; (EY - 1) * 40
        LDA EY
        SBC #1
        STA FAC1
        JSR MUL8
        STA NAYTTOOS + 1
        STX NAYTTOOS
        ; EX - 1
        LDX EX
        DEX
        TXA
        CLC
        ADC NAYTTOOS
        STA NAYTTOOS
        LDA #0
        ADC NAYTTOOS + 1
        STA NAYTTOOS + 1
        ; Valitaan näyttölohko 1024 ->
        CMP #0
        BNE L1
L0      LDX NAYTTOOS
        LDA #32
        STA 1024,X
        JMP LX
L1      LDA NAYTTOOS + 1
        CMP #1
        BNE L2
        LDX NAYTTOOS
        LDA #32
        STA 1280,X
        JMP LX
L2      LDA NAYTTOOS + 1
        CMP #2
        BNE L3
        LDX NAYTTOOS
        LDA #32
        STA 1536,X
        JMP LX
L3      LDA NAYTTOOS + 1
        CMP #3
        BNE LX
        LDX NAYTTOOS
        LDA #32
        STA 1792,X
        JMP LX

LX      

EXVANHA RTS


; ** Uusi pallo paikalleen **
UUSIPA
        ; (UY - 1) * 40
        LDA UY
        SBC #1
        STA FAC1
        JSR MUL8
        STA NAYTTOOS + 1
        STX NAYTTOOS
        ; UX - 1
        LDX UX
        DEX
        TXA
        CLC
        ADC NAYTTOOS
        STA NAYTTOOS
        LDA #0
        ADC NAYTTOOS + 1
        STA NAYTTOOS + 1
        ; Valitaan näyttölohko 
        CMP #0
        BNE P1
P0      LDX NAYTTOOS
        LDA #81
        STA 1024,X
        JMP PX
P1      LDA NAYTTOOS + 1
        CMP #1
        BNE P2
        LDX NAYTTOOS
        LDA #81
        STA 1280,X
        JMP PX
P2      LDA NAYTTOOS + 1
        CMP #2
        BNE P3
        LDX NAYTTOOS
        LDA #81
        STA 1536,X
        JMP PX
P3      LDA NAYTTOOS + 1
        CMP #3
        BNE PX
        LDX NAYTTOOS
        LDA #81
        STA 1792,X
        JMP PX
PX      

EXUUSI  RTS



; ** Laskenta **
LASKE   
        LDA UX
        STA EX
        LDX DX
        CPX #1
        BEQ XMIINUS
        INC UX
        JMP LASKEY
XMIINUS DEC UX

LASKEY  LDA UY
        STA EY
        LDY DY
        CPY #1
        BEQ YMIINUS
        INC UY
        JMP RAJAX
YMIINUS DEC UY

RAJAX   LDX UX
        CPX #41
        BNE RAJAXN
        LDA #39
        STA UX
        LDA #1
        EOR DX
        STA DX
        JMP RAJAY
RAJAXN  CPX #0
        BNE RAJAY
        LDA #2
        STA UX
        LDA #1
        EOR DX
        STA DX

RAJAY   LDY UY
        CPY #26
        BNE RAJAYN
        LDA #24
        STA UY
        LDA #1
        EOR DY
        STA DY
        JMP EXLASK

RAJAYN  CPY #0
        BNE EXLASK
        LDA #2
        STA UY
        LDA #1
        EOR DY
        STA DY

EXLASK  RTS


; ** Short 8bit * 8bit = 16bit multiply **
; Lähde: https://codebase64.pokefinder.org/
;        short_8bit_multiplication_16bit_product
; A*256 + X = FAC1 * FAC2
MUL8
        lda #$00
        ldx #$08
        clc
m0      bcc m1
        clc
        adc FAC2
m1      ror
        ror FAC1
        dex
        bpl m0
        ldx FAC1
        rts


; ** Näytön tyhjennys **
CLSCR   
        LDX #250
        LDA #32
LPCLS   STA 1023,X
        STA 1273,X
        STA 1523,X
        STA 1773,X
        DEX
        BEQ EXCLS
        JMP LPCLS
EXCLS   RTS


; ** Muuttujat **
DX      byte 1
DY      byte 1
UX      byte 20
UY      byte 12
EX      byte 20
EY      byte 12
NAYTTOOS word 0
FAC1    byte 0
FAC2    byte 40 ; Vakio tässä ohjelmassa


; ** Ohjelman loppu **

