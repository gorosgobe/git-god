class BaseCommand

  require_relative 'errors'
  require_relative 'range'

  attr_accessor :flag, :range

  def initialize(flag, range)
    @flag = flag
    @range = range
  end

  def parse(args)
    unless @range.within?(args.length)
      Errors.show_incorrect_number_args @flag, @range.to_s, args.length
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

end