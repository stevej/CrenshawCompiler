class Compiler
  def initialize(input=$stdin, output=$stdout)
    require 'pp'
    @input = input
    @output = output
  end

  attr_reader :look
  @look = ''

  def compile()
    init
    expression
  end

  def init
    @look = @input.read(1)
    if @look.nil?
      raise("Look is nil")
    end
  end

  def expression
    unless getNum.nil?
      emitLn("mov $" + getNum + ", %eax")
    else
      nil
      #raise('expression broken')
    end
  end

  def emitLn(string)
    @output << string << "\n"
  end

  def isDigit(char)
    !!(char =~ /[0-9]/)
  end

  def isChar(char)
    !!(char =~ /[a-zA-Z]/)
  end

  def getNum
    expected('Integer') unless isDigit(@look)
    @look
  end

  def getChar
    expected('Character') unless isChar(@look)
    @look
  end

  def match(x)
    if @look == x
      getChar
    else
      expected("#{x} but instead found #{@look}")
    end
  end

  def expected(msg)
    raise("#{msg} expected")
  end
end
