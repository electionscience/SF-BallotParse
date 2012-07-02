#!/usr/bin/env ruby

require File.join('./', File.dirname(__FILE__), 'lib/conductor')
Conductor.conduct(ARGV[0])
