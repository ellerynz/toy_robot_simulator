class NullCommand < Command

  def initialize(instruction)
    @instruction = instruction
  end

  def execute
    print "Unknown instruction '#{@instruction}'\n"
  end

end
