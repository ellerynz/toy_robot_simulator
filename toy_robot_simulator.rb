require 'optparse'

options = {}

OptionParser.new do |parser|
  parser.on("-f", "--file FILE", "The file of commands for the robot to run.") do |file|
    options[:file] = file
  end
end.parse!

if options[:file]
  # `File#foreach` handles large files gracefully
  # `String#strip` is used to remove trailing newline characters
  instructions = File.foreach(options[:file]).map(&:strip)
else
  STDOUT.write("Uhoh! Looks like we're missing the file of robot commands.\n")
end
