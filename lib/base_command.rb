class BaseCommand

  require_relative 'errors'
  require_relative 'range'

  attr_accessor :flag, :range

  def initialize(flag, range)
    @flag = flag
    @range = range
  end

  def parse(args)
    unless @range.within?(args.length - 1)
      Errors.show_incorrect_number_args @flag, @range.to_s, args.length - 1
    end
  end

  def execute_command(args)
    parse args
    execute args
  end

  # User overridable
  def execute(_args)
    fail NotImplementedError
  end

  def help_command
    puts "gg #{@flag} - Number of arguments: #{@range}."
    help
  end

  # User overridable
  def help
    puts "No help available for command #{@flag}."
  end

end