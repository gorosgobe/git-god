module Errors

  def self.show_no_log_included_error
    puts "Error: no logs have been included."
    exit(128)
  end

  def self.show_push_aborted
    puts "Some script returned a non zero exit code. Push aborted."
    exit 128
  end

  def self.show_non_removable_config(flag)
    puts "Error: configuration for #{flag} cannot be removed."
    puts "The flag #{flag} is non configurable or does not exist."
    exit(128)
  end

  def self.show_not_git_repo_error
    puts "Error: current directory is not a git repository."
    exit(128)
  end

  def self.show_too_many_args_error(flag, expected, len)
    puts "Error: #{flag} received too many arguments. Expected #{expected}, got #{len}."
    exit(128)
  end

  def self.show_not_enough_args_error(flag, expected, len)
    puts "Error: #{flag} did not receive enough arguments. Expected #{expected}, got #{len}."
    exit(128)
  end

  def self.show_at_least_args_error(flag, at_least_num, actual_num)
    puts "Error: #{flag} expects at least #{at_least_num} arguments, but got #{actual_num}"
    exit(128  )
  end

  def self.show_delimiter_empty_error
    puts "Error: delimiter is empty or it is invalid."
    to_add_delimiter_tut
  end

  def self.show_invalid_delimiter_error
    puts "Error: invalid delimiter supplied for log."
    to_add_delimiter_tut
  end

  def self.to_add_delimiter_tut
    puts "To add a delimiter, add flag -del=\"<delimiter>\". Note the double quotes."
    puts "<delimiter> must be one or two characters."
    exit(128)
  end

  def self.show_flag_expect_message_error(flag, value)
    puts "Error: #{flag} expects a message, but got \"#{value}\"."
    expected_commit(flag)
  end

  def self.expected_commit(flag)
    puts "Expected: gg #{flag} \"<some message>\" [-cl <args>|-ct <args>]"
    exit(128)
  end

  def self.show_script_not_in_root_error(script, should_exit)
    puts "Error: script \"#{script}\" should be relative to the root directory of the git repository."
    exit 128 if should_exit
  end

  def self.show_error_issue_not_exist(name)
    puts "Error: issue with name #{name} or alias #{name} does not exist."
    expected_for_issue
  end

  def self.show_no_name_for_issue_error
    puts "Error: no name was supplied for a new issue."
    expected_for_issue
  end

  def self.show_no_name_or_alias_error
    puts "Error: Creating a new issue expects a name and an optional alias."
    expected_for_issue
  end

  def self.expected_for_issue
    puts "Expected: \"gg i -name=<issue-name>\" or \"gg i -name=<issue-name> -alias=<alias>\"."
    puts "Alternatively: \"gg i -n=<issue-name>\" or \"gg i -n=<issue-name> -a=<alias>\"."
    puts "To set the current issue, use \"gg i -<alias or name of issue>\"."
    exit(128)
  end

  def self.show_unsupported_command(arg)
    puts "Error: unexpected command \"#{arg}\" found."
    puts "To view a full list of all arguments to gg, run gg -commands."
    exit(128)
  end

  def self.show_invalid_size_commit(calling_flag)
    puts "Error: trying to commit but incorrect number of arguments supplied."
    expected_commit(calling_flag)
  end

  def self.show_incorrect_number_args(flag, expected, actual)
    puts "Error: incorrect number of arguments for #{flag}. Expected #{expected}, got: #{actual}"
    exit 128
  end

  def self.show_push_atts_no_atts_error
    puts "Error: trying to add a configuration for push but no attributes are found."
    puts "To add a configuration for push, use \"gg pc -o=<branch-name>\"."
    exit(128)
  end

  def self.show_pull_atts_no_atts_error
    puts "Error: trying to add a configuration for pull but no attributes are found."
    puts "To add a configuration for pull, use \"gg pl -o=<branch-name>\"."
    exit(128)
  end

  def self.show_empty_commit_error
    puts "Error: empty commit."
    exit 128
  end

  def self.show_lc_invalid_add_flag
    puts "Error: invalid argument supplied to additional flags."
    exit 128
  end

end
