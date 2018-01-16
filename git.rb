module Git

  def Git.get_top_level
    `git rev-parse --show-toplevel`
  end

  def Git.get_url
    system "git remote get-url origin"
  end

  def Git.get_status
    system "git status"
  end

  def Git.get_local_branches
    system "git branch"
  end

  def Git.get_all_branches
    system "git branch -a"
  end

  def Git.fetch_all
    system "git fetch --all"
  end

  def Git.get_diff
    system "git diff"
  end

  def Git.get_current_branch
    `git rev-parse --abbrev-ref HEAD`
  end

end