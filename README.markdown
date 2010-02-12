Taking screenshots of websites is now easy
==========================================

## Prerequisites

* Ruby > 1.8.6
* Rubygems
* Qt4 (with WebKit)
* xvfb

See the ubuntu-setup.sh file for a nice script to install everything you need for you.

## Install

    sudo gem install straight_shooter

## Usage

    xvfb-run -a straight_shooter http://google.com result.png

## TODO

* Better color depth
* Fonts!
* Make it possible to start xvfb if it's not already running and have Qt use it for rendering
* How to run without xvfb?
* Prereq install instructions for more platforms