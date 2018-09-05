class GitLogOneLine < BaseCommand

  require_relative '../lib/base_command'
  require_relative '../lib/git'

  def initialize
    super("lgc", Range.new(0))
  end

  def execute(_args)
    Git.log_commit_oneline
  end

  def help
    puts "Outputs your commits in the form <hash> <commit-message>, with one per line, ordered by most recent. Suitable for parsing."
  end

end