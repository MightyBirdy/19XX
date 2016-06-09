// cheats.asm

// Tournament Settings By Default
.org	0x42D1B
hex		{ 020100 }			; (?)
hex 	{ 08 }				; default time (8 mins)
hex 	{ 04 }				; default stock (5 stock) 
hex		{ 00 }				; handicap (off)
hex 	{ 01 } 				; team attack (on)
hex 	{ 01 } 				; stage select (on)
hex		{ 64 } 				; damage (#100%)
/*
0 = Item Frequency

01 = $00000080
02 = $00000100
03 = $00002000
04 = $00000200
05 = $00004000
06 = $00008000
07 = $00010000
08 = $00060000
09 = $00080000
10 = $00000800
11 = $00001000
12 = $00000400
13 = $00000010
14 = $00000020
15 = $00000040
*/

hex		{ 0000420F }		; binary item toggles/debug menu
hex 	{ 01000000 }		; (?)
hex 	{ 00000000 }		; (?)
hex 	{ 00000000 }		; (?)
hex 	{ 00 }				; item frequency (none)
.org 	0x42B3B
hex		{ FFFFFF }			; all characters/stages unlocked

// All Computers Are Level 9 By Default [Mada0]
.org 	0x42D38
hex		{ 09 }
.org	0x42DAC
hex		{ 09 }
.org	0x42E20
hex		{ 09 }
.org	0x42E94
hex		{ 09 }

// Boot to (03 = System Debug, 04 = Versus, Debug, 10 = CSS) [Mada0]
.org 	0x42Cd0
hex		{ 10 }
 
// Return to Title Screen  After Inactivity Disabled (CSS)
.org	0x138BDC			; @ 8013A95c 
// hex	{ 17190009 }		; bne t8, t9, target
hex		{ 10000009 }		; beq r0, r0, target

// Return to Title Screen  After Inactivity Disabled (SSS)
.org	0x14F928			; @ 80133Db8
hex		{ 10000009 }

// Return to Title Screen After Inactivity Disabled (VMS)
.org	0x1245a0			; @ 80133BF0
hex		{ 10000009 }

// Return to Title Screen After Inactivity Disabled (VOS)
.org 	0x1245a0
hex		{ 1000000b }

// allow  multiple players to be the same color
.org	0x1361C8			; @ 80137F48
hex		{ 10000005 }		; beq r0, r0, 0x80137F60

// Pressing B out of versus loads Character Select Screen
.org	0x124750		; @ 80133DA0
ori 	t6, r0, $10

// Japanese Hit Sounds
/*
Address Changes
X		 Y
80073F84 80074FB7
80073F88 80074FAE
80073F8C 80074FC2
80073FF8 80074FA5
80073FFC 80074F9A
80074000 80074FC2
80074008 80074F9A

Table Starts at @ 80073f80 (0xF57BF0)

Value = Y - 80073F80
*/

/*
.org	0xF57BF4
hex 	{ 00001037 }
hex 	{ 0000102E }
hex		{ 00001042 }

.org 	0xF57C68
hex 	{ 00001025 }
hex 	{ 0000101a }
hex 	{ 00001042 }
hex 	{ 0000101a }
*/

// Disable Anti Aliasing

/*
Gameshark Code Port [xdaniel, Jorgasms]
8103D55C 0000
8103D55E 0212
8103D58C 0000
8103D58E 0212

  Bit   Expl.
  0-1   Type (Pixel Size) (0-3, see below)
         0 = blank    (no data, no sync)
         1 = reserved
         2 = 5/5/5/3  ("16" bit)
         3 = 8/8/8/8  (32 bit)
  2     Gamma Dither Enable (normally on, unless "special effect")
  3     Gamma Enable (normally on, unless MGEG/JPEG)
  4     DIVOT Enable (normally on if antialiased unless decal lines)
  5     reserved - always off
  6     serrate (always on if interlaced, off if not)
  7     reserved - diagnostics only
  8-9   anti-alias (aa) mode
         0 = aa & resamp (always fetch extra lines)
		 1 = aa & resamp (fetch extra lines if needed)
		 2 = resamp only (treat as all fully covered)
		 3 = neither (replicate pixels, no interpolate)
  11    reserved - diagnostics only
  12-15 reserved

00010012 - Default in game value
00000212 - New In game
  
@ 80032BF8
lw		t2, 0x4(t1)				; get value from 80044eec
jal		0x80035840
sw		t2, 0xc(t0)				; store value

Note:cg I can't inject a function here, I get an error because
that ROM space (where the DMA function is) has not been
mapped yet.
*/

/*
.org	0x337F8					; @ 80032BF8
ori		t2, r0, $0212
*/

// Widescreen [Danny_SsB]
.org	0xAA37C
hex		{ 3FEF311A }
.org	0x51C80
hex		{ 3FEF311A }
/*
.org	 0x891B4		``	; @ 8010D9B4
nop							; 
*/

/*
// Always show stock as number
.org 		0x8B0D4				; @ 8010F8D4
slti 		at, s1, $1			; default value is 7

// Skip Results Screen
.org 	0x10B204 				; @ 8018E314
li 		t6, $10

// Disable Music
.org 	0x216fc					; @ 80020AFC
nop

// Show Hitboxes [Mada0]
.org 	0x6e404					; @ 800F2C04
nop

// Planet Zebes Acid [pillowhead]
.org	0xAA04C
hex		{ 801056F8 }


// All Players are Skeleton [Mada0]

800F24B0 3C030800
800E10D8 3C020800
800F2C2C 3C180800
800F2D20 3C0F0800
800F2228 3C0F0800