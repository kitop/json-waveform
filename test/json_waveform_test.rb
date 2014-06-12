require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "json-waveform"))

require "minitest"
require "minitest/autorun"
require "fileutils"
require 'json'

module Helpers
  def fixture(file)
    File.join(File.dirname(__FILE__), "fixtures", file)
  end
end

class JsonWaveformTest < Minitest::Test
  include Helpers
  extend Helpers

  def test_generates_waveform
    result = JsonWaveform.generate(fixture("sample.wav"))

    assert_equal File.read(fixture("sample.peak.json")), JSON.dump(result)
  end

  def test_generates_rms_waveform
    result = JsonWaveform.generate(fixture("sample.wav"), method: :rms)

    assert_equal File.read(fixture("sample.rms.json")), JSON.dump(result)
  end

  def test_changes_samples
    result = JsonWaveform.generate(fixture("sample.wav"), samples: 100)

    assert_in_delta 100, result.size, 1
  end

  def test_changes_amplitude
    result = JsonWaveform.generate(fixture("sample.wav"), amplitude: 100)

    original = JSON.parse(File.read(fixture("sample.peak.json")))

    assert_in_delta original.max * 100, result.max, 1
  end

  def test_has_auto_width
    result = JsonWaveform.generate(fixture("sample.wav"), auto_samples: 10)

    assert_equal 210, result.size
  end

  def test_raises_error_if_not_given_readable_audio_source
    assert_raises JsonWaveform::RuntimeError do
      JsonWaveform.generate(fixture("sample.txt"))
    end
  end

  def test_raises_exception_if_audio_not_exists
    assert_raises JsonWaveform::RuntimeError do
      JsonWaveform.generate(fixture("foo.wav"))
    end
  end

  #def test_raises_deprecation_exception_if_ruby_audio_fails_to_read_source_file
  #  begin
  #    Waveform.generate(fixture("sample.txt"), output("shouldnt_exist.png"))
  #  rescue Waveform::RuntimeError => e
  #    assert_match /Hint: non-WAV files are no longer supported, convert to WAV first using something like ffmpeg/, e.message
  #  end
  #end
end
