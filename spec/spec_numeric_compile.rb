require 'spec_helper.rb'

describe Compiler, "when given input" do
  it "should do nothing" do
    compiler = Compiler.new
    compiler.compile($stdin).should == ""
  end
end
