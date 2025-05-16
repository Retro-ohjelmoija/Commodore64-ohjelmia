# SID-äänipiirin ohjelmoiniti Basicilla

Selityksiä:
* attack - aika joka äänellä kuluu nollasta asetettuun äänen voimakkuuten
* decay - aika asetusta yleisestä maksimi äänevoimakkuudesta asetettuun sustain-tasoon
* sustain - äänen voimakkuus pitovaiheessa
* release - aika joka kuluu äänen hiipuessa sustain-tasosta nollaan

Huomioitavaa
- Attack ja decay muodostavat äänen alkuun "iskun" ja sustain vaihe on iskun jälkeen tasainen äänenvoimakkuus.
- Decay on käynnistettävä erikseen, jolloin decay-vaihe alkaa. Muuten ääni jää sustain-tilaan (jatkuu loputtomiin)
- Attack ja decay ovat samassa rekisterissä (muistiosoitteessa), toinen ylemmät 4 bittiä ja toinen alemmat
- Sustain ja release ovat samassa rekisterissä (muistiosoitteessa), toinen ylemmät 4 bittiä ja toinen alemmat

SID-piirissä on kolme yhtäaikaista ääntä. Tämä esimerkki käsittelee vain ääntä 1.

```
10 rem (c) 2025 retro-ohjelmoija

100 gosub 1000 : rem alusta sid
110 vl=15 : gosub 2000 : rem aanen voimakkuus 
120 fr=440 : gosub 3000 : rem taajuus hz
130 at=4 : de=5 : gosub 4000 : rem attach ja decay
140 su=15 : re = 9 : gosub 5000 : rem sustain ja release

200 ke = 400 : rem sustain vaiheen kesto
210 wf=1 : rem kolmio
220 print "kolmio"
230 gosub 800
240 wf=2 : rem saha
250 print "saha"
260 gosub 800
270 wf = 4 : rem pulssi
280 print "pulssi"
290 pw=4000 : gosub 8000 : rem pulssin leveys
300 gosub 800
310 print "kohina"
320 wf=8 : rem kohina
330 gosub 800

400 ke = 800 : rem sustai vaiheen kesto
410 print "kitaran kielet"
420 wf=2 : rem saha
430 print "e"
440 for l = 1 to 3 : fr=334.5 : gosub 900 : next l
450 print "b"
460 for l = 1 to 3 : fr=250.5 : gosub 900 : next l
470 print "g"
480 for l = 1 to 3 : fr=198.7 : gosub 900 : next l
490 print "d"
500 for l = 1 to 3 : fr=149 : gosub 900 : next l
510 print "a"
520 for l = 1 to 3 : fr=111.7 : gosub 900 : next l
530 print "e"
540 for l = 1 to 3 : fr=83.6 : gosub 900 : next l

600 end


800 rem ** skaala **
805 print "c"
810 fr=261.6 : gosub 900
815 print "d"
820 fr=293.7 : gosub 900
825 print "e"
830 fr=329.6 : gosub 900
835 print "f"
840 fr=349.2 : gosub 900
845 print "g"
850 fr=392 : gosub 900
855 print "a"
860 fr=440 : gosub 900
865 print "b"
870 fr=493.9 : gosub 900
880 return

900 rem ** soita aani taajuudella fr **
910 gosub 3000 : rem taajuus hz (fr:n arvo)
920 gosub 6000 : rem toista aani, wf=aaltomuoto
930 for i = 1 to ke : next : rem sustain vaiheen kesto
940 gosub 7000 : rem sammuta aani
950 for i = 1 to 200 : next : rem aani hiipuu
960 return 


1000 rem ** sid alustus **
1010 sd=54272 : rem sid base
1020 for i = 0 to 28 : poke sd + i, 0 : next
1030 return

2000 rem ** aanen voimakkuus 0 - 15 **
2010 poke sd+24,vl
2020 return 

3000 rem ** taajuus fr = hz **
3010 fx=int(fr / 0.0596)
3020 fh = int(fx / 256)
3030 poke sd+0, fx - fh*256 : poke sd+1, fh
3040 return

4000 rem ** at = attach, de = decay. 0 - 15
4010 poke sd+5, at*16+de
4020 return

5000 rem ** su = sustain, re = release
5005 rem su = voimakkuus 0 - 15, re = aika 0 - 15
5010 poke sd+6, su*16+re
5020 return

6000 rem ** aaltomudon valinta ja aanen aloitus **
6005 rem wf: kolmio=1, saha=2, pulssi=4, kohina=8
6010 poke sd+4,wf*16+1
6020 return

7000 rem ** aanen sammutus, aloitetaan decay
7010 poke sd+4,wf*16
7020 return
 
8000 rem ** pulssin kesto pw = 1 - 4094**
8010 ph=int(pw/256)
8020 poke sd+2,pw-ph*256 : poke sd+3,ph
8030 return

```
