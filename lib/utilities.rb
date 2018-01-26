module Utilities

  require_relative 'flags'
  require_relative 'errors'
  require_relative 'constants'
  require_relative 'git'

  def self.get_key_from_flag(flag)
    unless configurable?(flag)
      Errors.show_non_removable_config flag
    end
    case flag
      when GitGodFlags::LOG
        GitGodConstants::LOGGED
      when GitGodFlags::PUSH_CONFIG
        GitGodConstants::PUSH_ORIGIN
      when GitGodFlags::PULL_CONFIG
        GitGodConstants::PULL_ORIGIN
      when GitGodFlags::ADD_ALL
        GitGodConstants::ADD
      when GitGodFlags::ISSUE
        GitGodConstants::ISSUE
      when GitGodFlags::SCRIPT, GitGodFlags::SCRIPT_LONG
        GitGodConstants::RUN_SCRIPT
    end
  end

  def self.check_params_del(arg_spl, args)
    if args.length == 2
      Errors.show_no_log_included_error
    end

    if arg_spl.length == 1
      Errors.show_delimiter_empty_error
    end
  end

  def self.get_values
    info = Hash.new
    issues = Set.new
    scripts = Array.new
    config_file = open_config_file
    config_file.each_line do |line|
      line_array = line.strip.split("=")
      case line_array[0]
        when GitGodConstants::ISSUE
          # case when it is an issue, need to track name and alias
          alias_for_name = ""
          if line_array[2] != nil then alias_for_name = line_array[2] end
          issues << line_array[1] + "=" + alias_for_name
        when GitGodConstants::RUN_SCRIPT
          scripts << line_array[1]
        else
          info[line_array[0]] = line_array[1]
      end
    end
    [info, issues, scripts]
  end

  def self.add_issue_to_msg(issue, message)
    if defined_val?(issue)
      message += "(" + GitGodConstants::ISSUE_DELIMITER + issue.strip + ") "
    end
    message
  end

  def self.add_log_users_to_msg(log_users, message)
    if defined_val?(log_users)
      message += log_users
    end
    message
  end

  def self.add_issue_and_log(values)
    log_users = values[GitGodConstants::LOGGED]
    issue = values[GitGodConstants::CURRENT_ISSUE]

    message = ""
    message = add_issue_to_msg(issue, message)
    add_log_users_to_msg(log_users, message)
  end

  def self.add_and_commit(values, message)
    add_atts = values[GitGodConstants::ADD]
    if defined_val?(add_atts)
      puts "adding all"
      Git.add_all
    end
    puts "commiting..."
    puts "\"#{message}\""
    Git.commit message
  end

  def self.add_to_start(refs, before_ref)
    result = Array.new
    refs.each do |ref|
      result << before_ref + ref
    end
    result
  end

  def self.flag?(str)
    str[0] == '-'
  end

  def self.defined_val?(val)
    val != nil
  end


  def self.always_add_all
    FileUtilities.write_to_file_or_overwrite(GitGodConstants::ADD,
                                             "#{GitGodConstants::ADD}=#{GitGodConstants::ALL}")
  end

  def self.configurable?(flag)
    GitGodFlags::CONFIGURABLE.include? flag
  end

  def self.get_name_from_alias(alias_or_name)
    config_file = open_config_file
    begin
      config_file.each_line do |line|
        line_spl = line.strip.split("=")
        next if line_spl[0] != GitGodConstants::ISSUE
        # line is an issue
        if alias_or_name == line_spl[1] or alias_or_name == line_spl[2]
          return line_spl[1]
        end
      end
      # if not found return nil
      nil
    ensure
      config_file.close
    end
  end

  def self.check_if_git_repo
    # suppressing the output of git status
    system "git", "status", :out => File::NULL, :err => File::NULL
    if $?.exitstatus != GitGodConstants::EXIT_SUCCESS
      Errors.show_not_git_repo_error
    end
  end

  def self.correct_issue_arg_length(args)
    args.length >= 1 and args.length <= 3
  end

  def self.only_allow_one_arg(args, flag)
    if args.length > 2 then Errors.show_too_many_args_error(flag, 1, args.length - 1) end
    if args.length == 1 then Errors.show_not_enough_args_error(flag, 1, 0) end
  end

# after cloning we do not want to do anything else as we would not be yet inside the git repository
  def self.exec_if_clone_command_and_exit(args, clone_flag)
    if args[0] == clone_flag
      clone(args, clone_flag)
      exit GitGodConstants::EXIT_SUCCESS
    end
  end


end