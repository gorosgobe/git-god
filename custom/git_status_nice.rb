class GitIgnoreCommand < BaseCommand

  require_relative '../lib/base_command'

  def initialize
    super("gst", Range.new(0))
  end

  def execute(_args)
    system "git status -sb"
  end

end
