class GitIgnoreCommand < BaseCommand

  # Used as an example of custom implementation of commands for git-god.
  # Command "gg ig <file_to_add>" which will add the given file to .gitignore

  require_relative '../lib/base_command'
  require_relative '../lib/git'
  require_relative '../lib/fileutilities'

  GIT_IGNORE = ".gitignore"

  # Range receives the number of arguments accepted, in this case 1, the file name.
  # For cases when a range is necessary, then use Range.new with two arguments specifying
  # the lower and upper bounds
  def initialize
    super("ig", Range.new(1))
  end

  # args as given by ARGV, arg[0] will be the flag, arg[1] the first argument, and so on.
  def execute(args)
    root_dir = Git.get_top_level.strip
    file_name = args[1]
    Dir.chdir root_dir do

      unless File.exist?(GIT_IGNORE)
        # if it does not exist, create the file in the root directory and write the file name
        File.open(GIT_IGNORE, "w+") do |file|
          file.puts(file_name)
        end
        return
      end

      # file exists already, simply append
      FileUtilities.write_to_file(GIT_IGNORE, file_name)

    end
  end

end