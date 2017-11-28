<CsoundSynthesizer>
<CsOptions>
-o c.aiff
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
asig oscil p5, cpspch(p4), p6

outs asig,asig

endin
</CsInstruments>
<CsScore>
f1 0 4096 10 1.0 0.5 0.33 0.25 0.2 0.17 0.14 0.13 0.11 0.1

i1 0 3600 8.00 .6 1

</CsScore>
</CsoundSynthesizer>

