#!/usr/bin/ruby

$:.push('lib')

require 'compiler'

compiler = Compiler.new
compiler.compile()
