class BaseShortcut < BaseCommand

  require_relative 'base_command'
  require_relative 'range'

  def initialize(flag, shortcut)
    super flag, Range.new(1)
  end

end