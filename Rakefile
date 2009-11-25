require 'rubygems'
require './lib/crenshaw_compiler.rb'

require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec_*.rb']
#  t.options = '-v'
end

task :default  => :spec

