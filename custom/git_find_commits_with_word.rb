class GitFindCommitsWithWord < BaseCommand
  
  require_relative '../lib/base_command'
  require_relative '../lib/git'


  def initialize
     super("fcw", Range.new(1, 3))
  end

  def execute(args)

     r_present = false
     p_present = false

     if args.length == 4
        if args[2] == "r"
           r_present = true
           if args[3] == "p"
             p_present = true
           else
             error_exit("p", args[3])
           end
        else
           if args[2] == "p"
              p_present = true
              if args[3] == "r"
                r_present = true
              else
                error_exit("r", args[3])
              end
            else
              error_exit("r or p", args[2]) 
            end
        end
     elsif args.length == 3
       if args[2] == "r"
         r_present = true
       elsif args[2] == "p"
         p_present = true
       else
         error_exit("r or p", args[2])
       end
     end

     command = "git log --all --reverse "
     
     if p_present then command += " -p " end
     if r_present then command += " -G '#{args[1]}' " end

     command += "--source -S '#{args[1]}'"

     system command
  end

  def error_exit(flag, actual)
    puts "Expected flag #{flag}, but found #{actual}"
    exit 1
  end

  def help
    puts "gg #{@flag} \"<word(s)/regex to search for>\" [p] [r]"
    puts "Note that arguments p and r are optional and maybe passed in any order, as long as the word/regex to search for remains the first argument."
    puts ""
    puts "Finds all commits with the supplied word/regex. Useful to determine the first commit that introduced a given word. The commits are ordered in reverse: the first commit shown is the oldest one that introduced the supplied word. "
    puts ""
    puts "If \"p\" is added as another argument, gg #{@flag} will also show the patches done per commit. If \"r\" is added as another argument, gg #{@flag} will take in a regex to be used by the underlying git log command"
  end
end
