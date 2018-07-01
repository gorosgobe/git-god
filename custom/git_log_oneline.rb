class GitLogOneLine < BaseCommand

  require_relative '../lib/base_command'
  require_relative '../lib/git'

  def initialize
    super("lgo", Range.new(0))
  end

  def execute(_args)
    Git.log_oneline
  end

  def help
    puts "Outputs your commits in the form <hash> <commit-message>, with one per line, ordered by most recent. Good for parsing commit names."
  end

end