JsonWaveform
========

JsonWaveform is a class to generate waveform json files from audio files. You can combine it with http://waveformjs.org/ to create awesome waveforms in webpages. It also comes with a handy CLI you can use to generate waveform json files on the command line.

It is *heavily* influenced by https://github.com/benalavi/waveform

Installation
============

Waveform depends on `ruby-audio`, which in turn depends on libsndfile.

Build libsndfile from (http://www.mega-nerd.com/libsndfile/), install it via `apt` (`sudo apt-get install libsndfile1-dev`), `libsndfile` in brew, etc...

Then:

    $ gem install json-waveform

NOTE: If `ruby-audio` fails to compile and you have `libsndfile` available, it may be because of this: http://stackoverflow.com/questions/19919640/ruby-audio-1-6-1-install-error-with-installed-libsndfile-1-0-25

CLI Usage
=========

    $ json-waveform song.wav

There are some nifty options you can supply to switch things up:

    -s sets the samples of the waveform.
    -A sets the max amplitude.
    -m sets the method used to sample the source audio file, it can either be
        'peak' or 'rms'. 'peak' is probably what you want because it looks
        cooler, but 'rms' is closer to what you actually hear.

And to see (almost) this same info:

    -h will print out a help screen with all this info.

    $ json-waveform Motley\ Crüe/Kickstart\ my\ Heart.wav

Usage in code
=============

The CLI is really just a thin wrapper around the JsonWaveform class, which you can also use in your programs for reasons I haven't thought of. The JsonWaveform class takes pretty much the same options as the CLI when generating waveforms.

```ruby
JsonWaveform("foo.wav", samples: 1000) # => [ 0, 0.1, 0.15, ... ]
```

Requirements
============

`ruby-audio`

The gem version, *not* the old outdated library listed on RAA. `ruby-audio` is a wrapper for `libsndfile`. To install the necessary libs to build `ruby-audio` you can do `sudo apt-get install libsndfile1-dev` on Ubuntu or `brew install libsndfile` on OSX.


Tests
=====

    $ make

Sample sound file used in tests is in the Public Domain from soundbible.com: <http://soundbible.com/1598-Electronic-Chime.html>.

