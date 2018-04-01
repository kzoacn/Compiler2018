"** 01-s1.pdf page 62
" sop

dac = 0040000			" MEM: deposit AC
jms = 0100000			" MEM: jump to subroutine
dzm = 0140000			" MEM: deposit zero to memory
lac = 0200000			" MEM: load AC
xor = 0240000			" MEM: XOR with AC
add = 0300000			" MEM: one's complement add
tad = 0340000			" MEM: two's complement add
xct = 0400000			" MEM: execute
isz = 0440000			" MEM: increment and skip if zero
and = 0500000			" MEM: AND
sad = 0540000			" MEM: skip if AC different
jmp = 0600000			" MEM: jump
nop = 0740000			" OPR: no-op
i = 020000			" indirect
law = 0760000			" OPR: load accumulator with (instr)
cma = 0740001			" OPR: complement AC
las = 0750004			" OPR: load AC from switches
ral = 0740010			" OPR: rotate AC left
rar = 0740020			" OPR: rotate AC right
hlt = 0740040			" OPR: halt
sma = 0740100			" OPR: skip on minus AC
sza = 0740200			" OPR: skip on zero AC
snl = 0740400			" OPR: skip on non-zero link
skp = 0741000			" OPR: skip unconditionally
sna = 0741200			" OPR: skip on non-zero AC
szl = 0741400			" OPR: skip on zero link
rtl = 0742010			" OPR: rotate two left
rtr = 0742020			" OPR: rotate two right
cll = 0744000			" OPR: clear link
rcl = 0744010			" OPR: clear link, rotate left
rcr = 0744020			" OPR: clear link, rotate right
cla = 0750000			" OPR: clear AC
lrs = 0640500			" EAE: long right shift
lrss = 0660500			" EAE: long right shift, signed
lls = 0640600			" EAE: long left shift
llss = 0660600			" EAE: long left shift, signed
als = 0640700			" EAE: AC left shift
alss = 0660700			" EAE: AC left shift, signed
mul = 0653323			" EAE: multiply
idiv = 0653323			" EAE: integer divide
lacq = 0641002			" EAE: load AC with MQ
clq = 0650000			" EAE: clear MQ
omq = 0650002			" EAE: OR MQ into AC
cmq = 0650004			" EAE: complement MQ
lmq = 0652000			" EAE: load MQ from AC

dscs = 0707141			" DSK: clear status register
dslw = 0707124			" DSK: clear and load WC from AC
dslm = 0707142			" DSK: clear and load MAC from AC
dsld = 0707104			" DSK: clear and load TA and SA from AC
dsls = 0707144			" DSK: load status
dssf = 0707121			" DSK: skip on flags
dsrs = 0707132			" DSK: read status register

iof = 0700002			" PIC: interrupts off
ion = 0700042			" PIC: interrupts on
caf = 0703302			" CPU: clear all flags
clon = 0700044			" CLK: clear flag, enable
clsf = 0700001			" CLK: skip if overflow
"** 01-s1.pdf page 63
clof = 0700004			" CLK: clear flag, disable
ksf = 0700301			" KBD: skip if flag set
krb = 0700312			" KBD: read buffer
tsf = 0700401			" TTY: skip if flag set
tcf = 0700402			" TTY: clear flag
tls = 0700406			" TTY: load buffer, select
sck = 0704301			" S-2: skip on console keyboard
cck = 0704304			" S-2: clear console keyboard
lck = 0704312			" S-2: load console keyboard
rsf = 0700101			" PTR: skip if flag set
rsa = 0700104			" PTR: select alphanumeric mode
rrb = 0700112			" PTR: clear flag, or read buffer
psf = 0700201			" PTP: skip if flag set
pcf = 0700202			" PTP: clear flag
psa = 0700204			" PTP: alphanumeric mode
cdf = 0700501			" ???
lds = 0701052			" S-2: load display status
lda = 0701012			" S-2: load display address
wcga = 0704206			" S-2: ???
raef = 0700742			" S-2: resume after edges flag
rlpd = 0700723			" S-2: resume after light pen stop, disabled
beg = 0700547			" S-2: begin
spb = 0704401			" S-2: skip on push button flag
cpb = 0704404			" S-2: clear push button flag
lpb = 0704412			" S-2: load push buttons
wbl = 0704424			" S-2: write button lights
dprs = 0704752			" dataphone: read status
dpsf = 0704741			" dataphone: skip on flag
dpcf = 0704761			" dataphone: clear flag
dprc = 0704712			" dataphone: read character
crsf = 0706701			" CDR: skip if ready
crrb = 0706712			" CDR: read buffer
