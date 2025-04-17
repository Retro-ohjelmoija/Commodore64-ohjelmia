# Vision BASIC nopeustesti

Tämä ohjelma on muunnos perus-Basicilla tehdystä ohjelmasta Vision BASIC -ohjelmaksi. **Tämän ei ole tatkoitus olla esimerkki miten grafiikkaa tehdään Vision BASIC:lla. Vision BASIC:ssa on omat keinot (käskyt) tehdä grafiikkaa.**

Alkuperäinen C64 Basic-ohjelma, josta tämä on muunnettu: [Viivanpiirto](/C64%20Basic%20V2/Viivanpiirto.md)

Alkuperäisen ohjelmalla viiva tulee valmiiksi 70 sekunnissa, tällä ohjelmalla 10 sekunnissa.

> [!IMPORTANT]
> This is not an example how to create graphics in Vision BASIC. This is a test where regular Basic program for transported to Vision BASIC with minimum changes. Idea was to test execution speed gains. In this case from original 70 seconds to 10 seconds.

Ohjelmakoodi on muotoiltu niin, että sen voi copy-pasteta VICE emulaattorin ikkunaan, jossa Vision BASIC on käytössä.

Kirjoita ensin `new` komento ja liitä sitten alla oleva koodi. Aja ohjelma `run` -komennolla ja lopeta ohjelma painamalla jotain näppäintä.

```
0 clr : decimal hps, vps

10 rem (c) 2025 retro-ohjelmoija

11 a(0) = 1
12 a(1) = 2
13 a(2) = 4
14 a(3) = 8
15 a(4) = 16
16 a(5) = 32
17 a(6) = 64
18 a(7) = 128

50 bank 2

95 bsift=1024*16*2
100 base=2*4096+bsift
110 p1=peek(53272)
115 tmp = peek(53272) or 8
120 poke 53272,tmp
130 p2=peek(53265)
135 tmp=peek(53265) or 32
140 poke 53265,tmp

145 tmp=base+7999
150 for i=base to tmp
155 rem print i
160 poke i,0
170 next i

180 fs=1024 + bsift
182 fe=2023 + bsift
185 for i=fs to fe
190 poke i,16
200 next i


300 hps=0
310 vps=0
320 for i=1 to 320
330 hps=hps+1
340 vps=i / 320 * 200
350 gosub 1000
360 next i

960 get a$ : if a$="" then goto 960

970 poke 53272,p1
980 poke 53265,p2
990 print chr$(147)
999 end

1000 rem piirra piste
1001 hpsi=hps
1002 vpsi=vps
1010 xtmp=hpsi/8
1020 row=vpsi/8
1030 rivi=vpsi and 7
1040 bytex=row*320
1041 byt=8*xtmp+bytex+base+rivi
1045 bx = hpsi and 7
1050 bit=7-bx
1051 ax=a(bit)
1055 byx= peek byt or ax
1060 poke byt,byx
1070 return

```

