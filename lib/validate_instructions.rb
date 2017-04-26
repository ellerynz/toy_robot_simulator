class ValidateInstructions

  VALID_COMMANDS = [
    /^MOVE$/,
    /^LEFT$/,
    /^RIGHT$/,
    /^PLACE \d+,\d+,(NORTH|EAST|SOUTH|WEST)$/,
    /^REPORT$/,
  ]

  def initialize(instructions)
    @instructions = instructions
    @regexp = Regexp.union(VALID_COMMANDS)
  end

  # Attempt to find the first invalid instruction
  def perform
    @invalid_instruction =
      @instructions.detect do |instruction|
        instruction.match(@regexp).nil?
      end
  end

  def valid?
    @invalid_instruction.nil?
  end

  def error_message
    return '' if valid?
    "Hmmm looks like your command '#{@invalid_instruction}' is not in the valid set of commands"
  end


end
