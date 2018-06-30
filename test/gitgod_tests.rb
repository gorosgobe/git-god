require 'test/unit'
require_relative '../lib/git'

class GitGodTests < Test::Unit::TestCase

  TEST_DIRECTORY = "git-god-tests"

  def run_no_output(cmd)
    system cmd, :out => File::NULL
  end

  def setup
    $stdout.puts "Running test..."
    system "mkdir #{TEST_DIRECTORY}"
    Dir.chdir("#{TEST_DIRECTORY}")
    Git.init
  end

  def teardown
    Dir.chdir ".."
    system "rm -rf #{TEST_DIRECTORY}"
    $stdout.puts "Test completed."
    $stdout.puts ""
  end

  def test_setup_correctly
    run_no_output "gg gs"
    assert_equal($?.exitstatus, 0)
  end

  def test_git_god_config_file_autocreated
    assert_false(File.exists? ".git-god")
    run_no_output "gg gs"
    # check that .git-god was created correctly
    assert_true(File.exists? ".git-god")
  end

  def test_show_commit
     out = `gg sc "Test commit"`
     assert_equal out, " Test commit\n"
  end

  def test_log_added
    system "gg l gorosgobe"
    out = `gg sc "Test commit"`
    assert_equal out, "[gorosgobe] Test commit\n"
    system 'gg l -del="|" gorosgobe'
    out2 = `gg sc "Test commit"`
    assert_equal out2, "|gorosgobe| Test commit\n"

  end

end