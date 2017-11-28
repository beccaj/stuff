<CsoundSynthesizer>
<CsOptions>
-o marfle.aiff
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1
; oscil amplitude, frequency, function number
; .6, 440, 4
iconverted = cpspch(p4)
print iconverted

asig oscil p5, iconverted, p6

outs asig,asig

endin
</CsInstruments>
<CsScore>
f1 0 4096 10 1.0 0.0 0.0 0.0 0.0
f2 0 4096 10 1.0 0.0 0.0 0.0 1.0
f3 0 4096 10 1.0 0.5 0.33 0.25 1.0
f4 0 4096 10 1.0 0.5 0.33 0.25 0.2


i1 0 10 7.09 .6 3


</CsScore>
</CsoundSynthesizer>