module Help

  require_relative 'flags'
  require_relative 'errors'
  require_relative 'constants'

  def self.print_commands
    puts ""
    puts "List of commands in git-god:"
    puts "Note: opt(x) means x is optional."
    puts ""
    gg_add_all
    puts ""
    gg_local_branches
    puts ""
    gg_all_branches
    puts ""
    gg_commit
    puts ""
    gg_current_branch
    puts ""
    gg_checkout
    puts ""
    gg_clone
    puts ""
    gg_commit_push
    puts ""
    gg_delete_branch
    puts ""
    gg_diff
    puts ""
    gg_fetch_all
    puts ""
    gg_git_status
    puts ""
    gg_issue
    puts ""
    gg_log
    puts ""
    puts gg_long_commit
    puts ""
    gg_merge
    puts ""
    gg_new_branch
    puts ""
    gg_open_config
    puts ""
    gg_push
    puts ""
    gg_push_config
    puts ""
    gg_pull
    puts ""
    gg_pull_config
    puts ""
    gg_protected_commit_push
    puts ""
    gg_remove
    puts ""
    gg_root
    puts ""
    gg_status
    puts ""
    gg_show_commit
    puts ""
    gg_script
    puts ""
    gg_url
    puts ""
    Utilities.inspect_all_help
  end

  def self.parse_commands(args)
    # arg[0] will be the help flag

    if args.length == 1
      # only flag is there, so print the whole help
      print_commands
      return
    end

    args[1..-1].each do |arg|
      print_help_for_arg(arg)
    end
  end

  def self.print_help_for_arg(arg)
    case arg
      when GitGodFlags::ADD_ALL
        gg_add_all
      when GitGodFlags::LOCAL_BRANCHES
        gg_local_branches
      when GitGodFlags::ALL_BRANCHES
        gg_all_branches
      when GitGodFlags::COMMIT
        gg_commit
      when GitGodFlags::CURRENT_BRANCH
        gg_current_branch
      when GitGodFlags::CHECKOUT
        gg_checkout
      when GitGodFlags::HELP
        gg_commands
      when GitGodFlags::COMMIT_AND_PUSH
        gg_commit_push
      when GitGodFlags::DELETE_BRANCH
        gg_delete_branch
      when GitGodFlags::DIFF
        gg_diff
      when GitGodFlags::FETCH_ALL
        gg_fetch_all
      when GitGodFlags::GIT_STATUS
        gg_git_status
      when GitGodFlags::ISSUE
        gg_issue
      when GitGodFlags::LOG
        gg_log
      when GitGodFlags::LONG_COMMIT
        gg_long_commit
      when GitGodFlags::MERGE
        gg_merge
      when GitGodFlags::NEW_BRANCH
        gg_new_branch
      when GitGodFlags::PUSH
        gg_push
      when GitGodFlags::PUSH_CONFIG
        gg_push_config
      when GitGodFlags::PULL
        gg_pull
      when GitGodFlags::PULL_CONFIG
        gg_pull_config
      when GitGodFlags::PROTECTED_COMMIT_PUSH
        gg_protected_commit_push
      when GitGodFlags::REMOVE_CONFIG
        gg_remove
      when GitGodFlags::ROOT
        gg_root
      when GitGodFlags::STATUS, GitGodFlags::STATUS_LONG
        gg_status
      when GitGodFlags::SHOW_COMMIT
        gg_show_commit
      when GitGodFlags::SCRIPT, GitGodFlags::SCRIPT_LONG
        gg_script
      when GitGodFlags::OPEN_CONFIG_FILE
        gg_open_config
      when GitGodFlags::URL
        gg_url
      else
        Utilities.inspect_custom arg, is_help = true
      end
  end

  def self.gg_long_commit
    puts "gg lc"
    puts "Allows to commit with a specific message per changed file."
  end

  def self.gg_url
    puts "gg u"
    puts "Shows the url of the repo. Equivalent of \"git remote get-url origin\""
  end

  def self.gg_script
    puts "gg [scr|script] <script>"
    puts "Sets the given script/command to run before a push. Scripts/commands must be given relative to the root " +
             "directory of the git repository. Example: \"gg scr ls -a\"."
  end

  def self.gg_show_commit
    puts "gg sc \"<some message>\" [-cl <args>|-ct <args>|-sa <args>]"
    puts "Exactly the same as \"gg c\", but only shows the commitable message, without commiting."
  end

  def self.gg_status
    puts "gg [s|status]"
    puts "Shows the current configuration for the repo."
  end

  def self.gg_root
    puts "gg ro"
    puts "Shows the root of the repo. Equivalent of \"git rev-parse --show-toplevel\""
  end

  def self.gg_remove
    puts "gg r opt(<flags>)"
    puts "Removes the configuration of the flags supplied. If no flags are" +
             " supplied, the entire configuration is removed"
  end

  def self.gg_protected_commit_push
    puts "gg prcp <parent-branch> \"<some message>\" [-cl <args>|-ct <args>|-sa <args>]"
    puts "Protected commit and push."
    puts "Equivalent of \"git pull origin parent-branch\""
    puts "              \"git commit <commit-args>\""
    puts "              \"git push origin <current-branch>\""
  end

  def self.gg_pull_config
    puts "gg plc -o=<branch-name>"
    puts "Sets the configuration for pulling. Attribute origin must be supplied."
  end

  def self.gg_pull
    puts "gg pl opt(<branch-name>)"
    puts "Pulls from branch. If branch has not been supplied, pulls from the " +
             "branch configured. If no branch has been configured, then it defaults to master."
  end

  def self.gg_push
    puts "gg p opt(<branch-name>)"
    puts "Pushes. If the branch name is supplied, pushes to that branch. If not, " +
             "it will push to the branch configured. If no branch has been configured, will " +
             "default to master"
  end

  def self.gg_open_config
    puts "gg op"
    puts "Opens the configuration file #{GitGodConstants::CONFIG_FILE_EXTENSION} in VIM. Modify at own risk."
  end

  def self.gg_new_branch
    puts "gg nb <branch-name>"
    puts "Creates a new branch with the supplied name. Equivalent of \"git checkout -b branch-name\""
  end

  def self.gg_merge
    puts "gg m <branch-name>"
    puts "Merges the branch supplied to the current branch. Equivalent of \"git merge\""
  end

  def self.gg_log
    puts "gg l opt([-del=<delimiter>]) [<logs>]"
    puts "Sets the log to be the supplied arguments. An extra argument can be " +
             "added to specify the delimiter to use for these logs. The delimiter must be " +
             "one or two characters long."
    puts "Note that -del=<delimiter> must be passed in before any logs"
  end

  def self.gg_issue
    puts "gg i opt([-name=<name> | -name=<name> -alias=<alias>])"
    puts "gg i opt([-n=<name> | -n=<name> -a=<alias>])"
    puts "Adds an issue. To add a new issue, the name attribute must be specified. " +
             "Alias is not required. To set the current issue to be a certain issue defined " +
             "before, use \"gg i -<alias-or-name-given-to-issue>\". To delete the current " +
             "issue, use \"gg i\" with no arguments"
  end

  def self.gg_git_status
    puts "gg gs"
    puts "Shows the git repo status. Equivalent of \"git status\""
  end

  def self.gg_fetch_all
    puts "gg fa"
    puts "Equivalent of \"git fetch --all\""
  end

  def self.gg_diff
    puts "gg di"
    puts "Shows the difference between the current state of the repo versus the " +
             "last commit. Equivalent of \"git diff\""
  end

  def self.gg_delete_branch
    puts "gg d <branch-name>"
    puts "Deletes the given branch. Equivalent of \"git branch -d branch-name\""
  end

  def self.gg_commit_push
    puts "gg cp \"<some message>\" [-cl <args>|-ct <args>|-sa <args>]"
    puts "Commits and pushes. Arguments same as \"gg c\" above. Gets pushing " +
             "branch from configuration. If it has not been configured, then defaults to " +
             "master."
    puts "Equivalent of \"git commit <formatted-message-from-args>\""
    puts "              \"git push origin <config-branch-or-master>"
  end

  def self.gg_commands
    puts "gg -commands"
    puts "If you do not know what this is, how did you get here?!"
  end

  def self.gg_clone
    puts "gg cn <repo-url>"
    puts "Clones the given repository. Equivalent of \"git clone repo-url\""
  end

  def self.gg_checkout
    puts "gg ch <branch-name>"
    puts "Checkout to the given branch-name. Equivalent of \"git checkout branch-name\""
  end

  def self.gg_current_branch
    puts "gg cb"
    puts "Shows the current branch."
  end

  def self.gg_commit
    puts "gg c \"<some message>\" [-cl <args>|-ct <args>|-sa <args>]"
    puts "Commits a message, with optional flags -cl (Closing issues), -ct (Contributors), -sa (See also)"
    puts "Example: gg c \"hello\" -cl 23 45 -ct gorosgobe -sa 24"
    puts "Commits: hello. Closes #23, #45. Contributors: @gorosgobe. See also: #24."
  end

  def self.gg_all_branches
    puts "gg ba"
    puts "Shows all branches. Equivalent of \"git branch -a\""
  end

  def self.gg_local_branches
    puts "gg b"
    puts "Shows local branches. Equivalent of \"git branch\""
  end

  def self.gg_add_all
    puts "gg a"
    puts "Sets the configuration to add all files for every commit."
  end

  def self.gg_push_config
    puts "gg pc -o=<branch-name>"
    puts "Sets the configuration for pushing. Attribute origin must be supplied."
  end

end