require 'test/unit'
require_relative '../lib/git'
require_relative '../lib/utilities'

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
    assert_equal " Test commit\n", out
    out2 = `gg sc "Test commit" -cl 123 45 01 -ct gorosgobe -sa 78`
    assert_equal " Test commit. Closes #123, #45, #01. Contributors: @gorosgobe. See also: #78.\n", out2
  end

  def test_log_added
    run_no_output "gg l gorosgobe"
    out = `gg sc "Test commit"`
    assert_equal "[gorosgobe] Test commit\n", out
    run_no_output 'gg l -del="|" gorosgobe'
    out2 = `gg sc "Test commit"`
    assert_equal "|gorosgobe| Test commit\n", out2
  end

  def test_remove_one
    run_no_output "gg l gorosgobe"
    out = `gg sc "Test commit"`
    assert_equal "[gorosgobe] Test commit\n", out
    run_no_output "gg r l"
    out2 = `gg sc "Test commit"`
    assert_equal  " Test commit\n", out2
  end

  def test_remove_config_file
    run_no_output "gg r"
    assert_false File.exists?(".git-god")
  end

  def test_remove_configs_multiple
    run_no_output "gg l gorosgobe"
    run_no_output "gg l johndoe"
    run_no_output "gg a"
    run_no_output "gg plc -o=master"
    run_no_output "gg r l plc"
    File.open ".git-god" do |file|
      file.each_line do |line|
        assert_equal "add=all\n", line
      end
    end
  end

  def test_commit
    run_no_output "echo 'hello' > test.txt"
    run_no_output "gg a"
    run_no_output  "gg c 'Test commit'"
    run_no_output "echo 'hello' > test2.txt"
    run_no_output  "gg c 'Test commit number 2'"
    list = Utilities.get_list_commits
    $stdout.puts list
    assert_equal 2, list.length
    assert_equal " Test commit number 2", list[0]
    assert_equal " Test commit", list[1]
  end

end