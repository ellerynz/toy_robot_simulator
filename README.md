# Toy Robot Simulator

A robot that accepts commands to move around an empty table.

**Rules:**
- A robot should ignore commands that take if off the table
- A robot should reject commands when not on the table
- A robot should not be placed off of the table

**Commands**
- MOVE
  Attempts to move the robot forward in the direction it is facing
- PLACE X,Y,F
  Attempts to place the robot at X,Y and facing the direction F
- LEFT
  Rotates a robot 90 degrees left
- RIGHT
  Rotates a robot 90 degrees right
- REPORT
  Outputs the robots position and direction (X,Y,F)

## Usage
Built using `ruby 2.1.7`.

To use, run the following from `toy_robot_simulator/`:
```
ruby toy_robot_simulator.rb -f example_input.txt
```

`example_input.txt` can be a path to any file. The file should contain commands mentioned above with each command on a newline.

## Design
Toy Robot Simulator uses the [command](https://en.wikipedia.org/wiki/Command_pattern) design pattern to queue and execute commands.
This way we make it clear and obvious where to add a new command, easier to add a new command, and separates the what/who/when. For example, the robot knows nothing about the instructions.
All we need to do is create a command in the `lib/commands/` folder, update `ValidateInstructions`, and bind the command in `RobotClient`.

Extra reading:
[https://github.com/nslocum/design-patterns-in-ruby#commands](https://github.com/nslocum/design-patterns-in-ruby#commands)

