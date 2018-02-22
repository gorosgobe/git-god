class GitStash < BaseCommand

  require_relative '../lib/base_command'

  def initialize
    super("st", Range.new(0))
  end

  def execute(_args)
    system "git stash"
  end

end
