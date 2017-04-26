class NullCommand < Command

  def initialize(instruction)
    @instruction = instruction
  end

  def execute
    STDOUT.write("Unknown instruction '#{@instruction}'\n")
  end

end
