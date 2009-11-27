require 'spec_helper.rb'


describe Compiler, "when given input" do
  before do
    @orig_stdin = $stdin
    $stdin = StringIO.new
    @orin_stdout = $stdout
    $stdout = StringIO.new
    @compiler = Compiler.new($stdin, $stdout)
  end

  def stdout
    $stdout.rewind
    $stdout.read
  end

  it "should do nothing with no input" do
    lambda { @compiler.compile() }.should raise_error(RuntimeError)
  end

  it "should see each character" do
    $stdin << "1+2"
    $stdin.rewind
    lambda { @compiler.init }.should_not raise_error
    lambda { @compiler.look.should == "1" }.should_not raise_error
    lambda { @compiler.init }.should_not raise_error
    lambda { @compiler.look.should == "+" }.should_not raise_error
    lambda { @compiler.init}.should_not raise_error
    lambda { @compiler.look.should == "2" }.should_not raise_error
  end

  it "should output something useful for a single number" do
    $stdin << "1"
    $stdin.rewind
    lambda { @compiler.compile() }.should_not raise_error
    $stdout.rewind
    $stdout.read.should == "mov $1, %eax\n"
  end

  it "should throw up on non-number input" do
    $stdin << "!"
    $stdin.rewind
    lambda { @compiler.compile() }.should raise_error
  end

  it "should output addition instructions" do
    $stdin << "1+2"
    $stdin.rewind
    lambda { @compiler.compile() }.should_not raise_error
    $stdout.rewind
    $stdout.read.should == "mov $1, %eax\n"
    # FAIL
    $stdout.read.should == ""
  end
end

