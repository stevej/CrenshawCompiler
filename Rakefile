require 'rubygems'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/spec_*.rb']
  t.spec_opts = ['--colour', '--reverse', '--format specdoc']
  #  t.options = '-v'
end

task :default  => :spec
