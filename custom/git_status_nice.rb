class GitStatusNice < BaseCommand

  require_relative '../lib/base_command'

  def initialize
    super("gst", Range.new(0))
  end

  def execute(_args)
    system "git status -sb"
  end

  def help
    puts "Alternative formatting for git status. With thanks to @tiimgreen."
  end

end
