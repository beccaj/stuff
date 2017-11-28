require 'rails'
# pitches = {c: 0, c_sharp: 1, d: 2, d_sharp: 3, e: 4, e_sharp: 5, f: 6, f_sharp: 7, }

STARTING_OCTAVE = 8
SECONDS_PER_NOTE = 1800 # 250
SHARP_NAMES = ["c", "c_sharp", "d", "d_sharp", "e", "f", "f_sharp", "g", "g_sharp", "a", "a_sharp", "b"]
FLAT_NAMES = ["c", "d_flat", "d", "e_flat", "e", "f", "g_flat", "g", "a_flat", "a", "b_flat", "b"]

def padded_pitch(note)
  note.to_s.rjust(2, "0")
end

def note_name(note)
  SHARP_NAMES[note]
end


def get_track_name(note)
"#{padded_pitch(note)}_#{note_name(note)}"
end

def get_file_name(note)
  "#{get_track_name(note)}.csd"
end

def get_csound_file(note)
"""
<CsoundSynthesizer>
<CsOptions>
-o #{get_track_name(note)}.aiff
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

i1 0 #{SECONDS_PER_NOTE} #{STARTING_OCTAVE}.#{padded_pitch(note)} .6 1

</CsScore>
</CsoundSynthesizer>

"""
end

def generate_partials
  (1..10).map {|i| "#{(1.0/i).round(2)}" }.join(" ")
end

def generate_csound_file(note)
  filestring = get_csound_file(note)
  file_name = get_file_name(note)

  puts "writing #{file_name}"
  File.write(file_name, filestring)
end

# def generate_test_files(note = 0)
#   generate_csound_file(note)
#   generate_aiff_file(note) # TODO not written yet
# end

def generate_csound_files
  (0..11).each do |note|
    generate_csound_file(note)
  end
end

def generate_aiff_file(file_name)
  "puts running csound"
  `csound #{file_name}`
end

def generate_aiff_files
  files = Dir.entries(".").select {|file| file =~ (/^\d\d.+csd$/)}
  files.each do |file|
    generate_aiff_file(file)
  end
end

generate_csound_files
generate_aiff_files



