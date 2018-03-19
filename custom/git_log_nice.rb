class GitLogNice < BaseCommand

  require_relative '../lib/base_command'

  def initialize
    super("lg", Range.new(0))
  end

  def execute(_args)
    system "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
  end

  def help
    puts "Outputs your git log in a formatted way. With thanks to @tiimgreen."
  end

end
