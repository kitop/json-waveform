.PHONY: console test

test: 
	ruby test/json_waveform_test.rb

console: 
	irb -I./lib -r json-waveform
