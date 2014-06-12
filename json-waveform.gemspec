require "./lib/json-waveform/version"

Gem::Specification.new do |s|
  s.name              = "json-waveform"
  s.version           = JsonWaveform::VERSION
  s.summary           = "Generate waveform JSON files from audio files"
  s.description       = "Generate waveform JSON information from audio files, compatible with http://waveformjs.org/."
  s.authors           = ["Esteban Pastorino"]
  s.email             = ["ejpastorino@gmail.com"]
  s.homepage          = "http://github.com/kitop/json-waveform"

  s.files = Dir[
    "LICENSE",
    "README.md",
    "makefile",
    "lib/**/*.rb",
    "*.gemspec",
    "test/**/*.rb",
    "bin/*"
  ]

  s.executables << "json-waveform"

  s.add_dependency "ruby-audio", "~> 1.6.0"
  s.add_development_dependency "minitest", "~> 4"
end
