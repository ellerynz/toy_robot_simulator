require 'minitest/autorun'
require_relative '../lib/validate_instructions'

class ValidateInstructionsTest < Minitest::Test

  def test_should_pass_with_valid_input
    instructions = ['MOVE', 'LEFT', 'PLACE 1,1,NORTH', 'RIGHT', 'REPORT']
    validate_instructions = ValidateInstructions.new(instructions)
    validate_instructions.perform
    assert validate_instructions.valid?
  end

  def test_should_pass_with_each_direction
    instructions = ['PLACE 1,1,NORTH', 'PLACE 1,1,EAST', 'PLACE 1,1,SOUTH', 'PLACE 1,1,WEST']
    validate_instructions = ValidateInstructions.new(instructions)
    validate_instructions.perform
    assert validate_instructions.valid?
  end

  def test_should_accept_non_single_digit_numbers
    instructions = ['PLACE 11,1111,NORTH', 'PLACE 1,0,EAST']
    validate_instructions = ValidateInstructions.new(instructions)
    validate_instructions.perform
    assert validate_instructions.valid?
  end

  def test_should_return_a_message_when_invalid
    instructions = ['PLACE 11,1111,NORTH', 'PLACE -1,0,THEWALL']
    validate_instructions = ValidateInstructions.new(instructions)
    validate_instructions.perform
    refute validate_instructions.valid?
    assert validate_instructions.error_message.length > 1
  end

  def test_should_have_no_error_message_when_valid
    instructions = ['MOVE']
    validate_instructions = ValidateInstructions.new(instructions)
    validate_instructions.perform
    assert validate_instructions.valid?
    assert validate_instructions.error_message.empty?
  end

end
