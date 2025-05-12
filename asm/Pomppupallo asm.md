# Reunoista pomppaava pallo - assembly versio (Basic lataajalla)

_Basic-lataaja sivun lopussa._

Ohjelma on niin nopea, että ilman hidastuslooppia (katso label VIIVE) pallon liikettä ei näe ruudulla.

Assembly-ohjelmaa ei ole yritetty millään tavalla optimoida.

Alkuperäinen Basic-versio on täällä: [Reunoista pomppaava pallo](../C64%20Basic%20V2/Pomppupallo%202.md) - nopea (mutta hitaampi kuin tämä konekielinen-versio).

```
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


```

### Basic lataaja

Basic lataaja käännetylle ohjelmalle. Tämän voi copy - pasteta VICE:n ikkunaan. Tarvittaessa anna ensin `NEW`-komento poistaaksesi aiemman Basic-ohjelman muistista.

`RUN`-komento käynnistää Basic-ohjelman, joka lataa DATA-lauseista konekielisen ohjelman muistiin ja sen jälkeen käynnistää sen.

HUOM.: Ohjelmassa ei ole lopetustoimintoa, joten tee reset tai sammuta kone.

```
100 rem reunoista pomppaava pallo
110 rem (c) 2025 retro-ohjelmoija
120 print "loading";
130 l=0
140 sa = 49152
150 for n = 0 to 420
160 l=l+1:ifl=50thenprint".";:l=0
170 read a% : poke sa+n,a%: next n
180 sys sa
190 end
200 data 32,132,193,32,241,192,32,27
210 data 192,32,134,192,162,0,160,8
220 data 234,232,208,252,136,208,249,76
230 data 3,192,96,173,160,193,233,1
240 data 141,163,193,32,110,193,141,162
250 data 193,142,161,193,174,159,193,202
260 data 138,24,109,161,193,141,161,193
270 data 169,0,109,162,193,141,162,193
280 data 201,0,208,11,174,161,193,169
290 data 32,157,0,4,76,133,192,173
300 data 162,193,201,1,208,11,174,161
310 data 193,169,32,157,0,5,76,133
320 data 192,173,162,193,201,2,208,11
330 data 174,161,193,169,32,157,0,6
340 data 76,133,192,173,162,193,201,3
350 data 208,11,174,161,193,169,32,157
360 data 0,7,76,133,192,96,173,158
370 data 193,233,1,141,163,193,32,110
380 data 193,141,162,193,142,161,193,174
390 data 157,193,202,138,24,109,161,193
400 data 141,161,193,169,0,109,162,193
410 data 141,162,193,201,0,208,11,174
420 data 161,193,169,81,157,0,4,76
430 data 240,192,173,162,193,201,1,208
440 data 11,174,161,193,169,81,157,0
450 data 5,76,240,192,173,162,193,201
460 data 2,208,11,174,161,193,169,81
470 data 157,0,6,76,240,192,173,162
480 data 193,201,3,208,11,174,161,193
490 data 169,81,157,0,7,76,240,192
500 data 96,173,157,193,141,159,193,174
510 data 155,193,224,1,240,6,238,157
520 data 193,76,7,193,206,157,193,173
530 data 158,193,141,160,193,172,156,193
540 data 192,1,240,6,238,158,193,76
550 data 29,193,206,158,193,174,157,193
560 data 224,41,208,16,169,39,141,157
570 data 193,169,1,77,155,193,141,155
580 data 193,76,69,193,224,0,208,13
590 data 169,2,141,157,193,169,1,77
600 data 155,193,141,155,193,172,158,193
610 data 192,26,208,16,169,24,141,158
620 data 193,169,1,77,156,193,141,156
630 data 193,76,109,193,192,0,208,13
640 data 169,2,141,158,193,169,1,77
650 data 156,193,141,156,193,96,169,0
660 data 162,8,24,144,4,24,109,164
670 data 193,106,110,163,193,202,16,243
680 data 174,163,193,96,162,250,169,32
690 data 157,255,3,157,249,4,157,243
700 data 5,157,237,6,202,240,3,76
710 data 136,193,96,1,1,20,12,20
720 data 12,0,0,0,40

```

---


_Assembly-koodaus ja Basic-loaderi tehty CBM prg Studiolla_

