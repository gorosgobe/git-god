# git-fast

A script that allows to save configurations for easier, more meaningful and faster comitting.

# Features
Commit the current message and push.
```
git-fast -c "message"  # commits formatting with the configuration
git-fast -c "message" -cl 189 200 -ct gorosgobe
# commits: "message. Closes #189, #200. Contributors: @gorosgobe."
git-fast -p
git-fast -cp "message" # commits same as first command but also pushes to configuration branch or master. See git-fast -p below
```
Shows the current configuration.
```
git-fast status
git-fast -s
```
Shows the commitable message without committing it.
```
$ git-fast -l gorosgobe
$ git-fast -sc "message -cl 189 200 -ct billgates
[gorosgobe] message. Closes #189, #200. Contributors: @billgates.    # output, not committed
```
Specifies that git should always add all files.
```
git-fast -a
```
Acts as a logging feature. All commits are preceded by the arguments supplied after the flag in square brackets. 
```
git-fast -l gorosgobe billgates
git-fast -c "new commit" # commits: "[gorosgobe][billgates] new commit"
```
Delimiters can also be specified directly.
```
git-fast -l gorosgobe --del="|" billgates
git-fast -c "new commit" # commits: "|gorosgobe||billgates| new commit"
```
Removes the configuration file. Alternatively, it can remove any previously configured flags, such as -l or -pc.
```
git-fast -r       # deletes the entire configuration
git-fast -r -l -pc # deletes configurations of -l and -pc flags
git-fast -r -i    # deletes all issues
```
Adds the origin attribute to the push command.
```
git-fast -pc --o=master    # sets up the configuration
git-fast -p                # git push origin master
git-fast -pc --o=my-branch
git-fast -p              # git push origin my-branch
```
Pushes to configuration branch by default. If it does not exist, pushes to master. If pushing to another branch, give as argument.
```
git-fast -p                    # pushes to master
git-fast -pc --o=my-branch
git-fast -p                    # pushes to my-branch
git-fast -p any-other-branch   # pushes to any-other-branch
git-fast -p                    # still pushes to my-branch
```
Pulls from configuration branch by default. If it does not exist, pulls from master. If pulling to another branch, give as argument.
```
git-fast -pl                   # pulls from master
git-fast -plc --o=my-branch    # sets pull origin branch to be my-branch
git-fast -pl                   # pulls from my-branch
git-fast -pl any-other-branch  # pulls from any-other-branch
git-fast -pl                   # still pulls from my-branch
```
Adds issue name to commit messages.
```
git-fast -l gorosgobe
git-fast -i --name="bugFix3" --alias=b3
git-fast -c "commit message"     # commits: "[gorosgobe]#bugFix3 commit message"
git-fast -i                      # sets current issue to be none
git-fast -c "commit message"     # commits: [gorosgobe] commit message"
git-fast -i -b3
git-fast -c "commit message 2"   # commits: "[gorosgobe]#bugFix3 commit message 2"
```
Gives the url of the repo.
```
git-fast -u   # equivalent of "git remote get-url origin"
```
Clones a repo.
```
git-fast -cn <repo-url>   # equivalent of "git clone <repo-url>"
```
Fetches all.
```
git-fast -fa                # equivalent of "git fetch --all"
```
Creates a new branch.
```
git-fast -nb <branch-name>  # equivalent of "git checkout -b <branch-name>"
```
Checkout to a branch.
```
git-fast -ch <branch-name>  # equivalent of "git checkout <branch-name>"
```
Deletes a branch.
```
git-fast -d <branch-name>   # equivalent of "git branch -d <branch-name>"
```
Lists branches and current branch
```
git-fast -b                 # equivalent of "git branch"
git-fast -ba                # equivalent of "git branch -a"
```
Shows the current git repository status
```
git-fast -gs                # equivalent of `git status`
```
