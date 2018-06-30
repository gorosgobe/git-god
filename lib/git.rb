module Git

  def self.get_top_level
    `git rev-parse --show-toplevel`
  end

  # gets the latest changed files in the latest commit
  def self.get_latest_changed_files
    out = `git diff --name-only #{get_current_branch.strip}`
    out.strip.split("\n")
  end

  def self.get_url
    system "git remote get-url origin"
  end

  def self.get_status
    system "git status"
  end

  def self.get_local_branches
    system "git branch"
  end

  def self.get_all_branches
    system "git branch -a"
  end

  def self.fetch_all
    system "git fetch --all"
  end

  def self.get_diff
    system "git diff"
  end

  def self.init
    system "git init"
  end

  def self.get_current_branch
    `git rev-parse --abbrev-ref HEAD`
  end

  def self.pull_origin(target_branch)
    begin
      system "git pull origin #{target_branch}"
    rescue Interrupt
      puts ""
      puts "Pull aborted."
    end
  end

  def self.push_origin(target_branch)
    begin
      system "git push origin #{target_branch}"
    rescue Interrupt
      puts ""
      puts "Push aborted."
    end
  end

  def self.commit(message)
    system "git commit -m \"#{message}\""
  end

  def self.new_branch(target_branch)
    system "git checkout -b #{target_branch}"
  end

  def self.checkout(target_branch)
    system "git checkout #{target_branch}"
  end

  def self.clone(repo)
    begin
    system "git clone #{repo}"
    rescue Interrupt
      puts ""
      puts "Clone aborted."
    end
  end

  def self.delete_branch(branch)
    system "git branch -d #{branch}"
  end

  def self.merge(branch)
    system "git merge #{branch}"
  end

  def self.add_all
    system "git add -A"
  end

end