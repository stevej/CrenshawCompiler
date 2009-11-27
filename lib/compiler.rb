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
    raise("Look is nil") unless @look
  end

  def term
    unless getNum.nil?
      emitLn("mov $" + getNum + ", %eax")
      getChar
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
    !!(char =~ /[a-zA-Z+-]/)
  end

  def getNum
    expected("found #{@look} but Integer") unless isDigit(@look)
    @look
  end

  def getName
    expected("found #{@look} but Character") unless isChar(@look)
    rv = @look.to_s
    getChar
    rv
  end

  def getChar
    @look = @input.read(1)
  end

  def expression
    term
    emitLn("mov %eax, %ebx")
    case @look
      when '+' then add
      when '-' then sub
      else expected('addop')
    end
  end

  def add
    match('+')
    term
    emitLn('add %ebx, %eax')
  end

  def sub
    match('-')
    term
    emitLn('sub %ebx, %eax')
  end


  def match(x)
    if @look == x
      getName
    else
      expected("#{x} but instead found #{@look}")
    end
  end

  def expected(msg)
    raise("#{msg} expected")
  end
end
