module GitGodFlags

  require_relative 'constants'

  ADD_ALL = "a"
  ISSUE_ALIAS = "-a"
  ISSUE_ALIAS_LONG = "-alias"
  LOCAL_BRANCHES = "b"
  ALL_BRANCHES = "ba"
  COMMIT = "c"
  CURRENT_BRANCH = "cb"
  CHECKOUT = "ch"
  CLOSES = "-cl"
  CLONE = "cn"
  CONTRIBUTES = "-ct"
  HELP = "h"
  COMMIT_AND_PUSH = "cp"
  DELETE_BRANCH = "d"
  LOG_DELIMITER = "-del"
  DIFF = "di"
  FETCH_ALL = "fa"
  GIT_STATUS = "gs"
  ISSUE = "i"
  LOG = "l"
  LONG_COMMIT = "lc"
  MERGE = "m"
  NEW_BRANCH = "nb"
  ISSUE_NAME = "-n"
  ISSUE_NAME_LONG = "-name"
  PUSH = "p"
  PUSH_CONFIG = "pc"
  PULL = "pl"
  PULL_CONFIG = "plc"
  PROTECTED_COMMIT_PUSH = "prcp"
  REMOVE_CONFIG = "r"
  ROOT = "ro"
  STATUS = "s"
  SEE_ALSO = "-sa"
  STATUS_LONG = "status"
  SHOW_COMMIT = "sc"
  SCRIPT = "scr"
  SCRIPT_LONG = "script"
  OPEN_CONFIG_FILE = "op"
  CONFIG_ORIGIN = "-o"
  URL = "u"

  CONFIGURABLE = [
      LOG,
      PUSH_CONFIG,
      ADD_ALL,
      ISSUE,
      PULL_CONFIG,
      SCRIPT,
      SCRIPT_LONG
  ]

  FLAGS_TO_CONSTANTS = {
      GitGodFlags::LOG         => GitGodConstants::LOGGED,
      GitGodFlags::PUSH_CONFIG => GitGodConstants::PUSH_ORIGIN,
      GitGodFlags::PULL_CONFIG => GitGodConstants::PULL_ORIGIN,
      GitGodFlags::ADD_ALL     => GitGodConstants::ADD,
      GitGodFlags::ISSUE       => GitGodConstants::ISSUE,
      GitGodFlags::SCRIPT      => GitGodConstants::RUN_SCRIPT,
      GitGodFlags::SCRIPT_LONG => GitGodConstants::RUN_SCRIPT,
  }

end