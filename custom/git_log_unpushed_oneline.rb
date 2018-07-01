class GitLogUnpushedOneLine < BaseCommand

  require_relative '../lib/base_command'
  require_relative '../lib/git'

  def initialize
    super("up", Range.new(0))
  end

  def execute(_args)
    Git.log_unpushed
  end

  def help
    puts "Outputs your unpushed commits in the form <hash> <commit-message>, with one per line, ordered by most recent. Suitable for parsing."
  end

end