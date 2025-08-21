## Tekstin väri (neljä taustaväriä) / Extended color mode

```
0 rem (c) 2025 retro-ohjelmoija
100 dim cc(15)
110 cc(0)=144:cc(1)=5:cc(2)=28:cc(3)=159
120 cc(4)=156:cc(5)=30:cc(6)=31:cc(7)=158
130 cc(8)=129:cc(9)=149:cc(10)=150:cc(11)=151
140 cc(12)=152:cc(13)=153:cc(14)=154:cc(15)=155

150 rem *** koko merkisto ***
160 rem for i = 32 to 33
170 rem a$ = a$ + chr$(i)
180 rem next i
190 rem for i = 35 to 95
200 rem a$ = a$ + chr$(i)
210 rem next i
220 rem *** malliasettelu a-j ***
230 a$="abcdefghij"

240 gosub 1000
250 for c=0 to 15 
260 print chr$(cc(c)); : rem tekstin vari

270 rem ** tausta 53281 **
280 print chr$(146); : rem reverse off
290 for i=1 to len(a$)
300 print chr$(asc(mid$(a$,i,1)));
310 next i

320 rem ** tausta 53282 **
330 print chr$(146); : rem reverse off
340 for i=1 to len(a$)
350 print chr$(asc(mid$(a$,i,1)) + 128);
360 next i

370 rem ** tausta 53283 **
380 print chr$(18); : rem reverse on
390 for i=1 to len(a$)
400 print chr$(asc(mid$(a$,i,1)));
410 next i

420 rem ** tausta 53284 **
430 print chr$(18); : rem reverse on
440 for i=1 to len(a$)
450 print chr$(asc(mid$(a$,i,1)) + 128);
460 next i

470 next c
480 get e$ : if e$ = "" then 480
490 gosub 1100
500 end

1000 rem extended color mode (text)
1010 poke 53265, peek(53265) or 64
1020 poke 53281,1 : rem 6 on normaali tausta
1030 poke 53282,7
1040 poke 53283,15
1050 poke 53284,0
1060 return

1100 rem normal text mode
1110 poke 646,14
1120 poke 53281,6
1130 poke 53265,peek(53265)and(255-64) 
1140 return

```
