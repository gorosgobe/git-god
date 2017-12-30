# git-god

A script that allows to save configurations for easier, more meaningful and faster comitting.

# Install

Add the following line to the bottom of your ~/.bashrc file:
```
export PATH=$PATH:<path-to-repo>
```
If you wish to feel even more like a god, add the following line too:
```
alias g='gg'
```

# Features
Commit the current message and push.
```
gg c "message"  # commits formatting with the configuration
gg c "message" -cl 189 200 -ct gorosgobe
# commits: "message. Closes #189, #200. Contributors: @gorosgobe."
gg p
gg cp "message" # commits same as first command but also pushes to configuration branch or master. See gg p below
```
Shows the current configuration.
```
gg status
gg s
```
Shows the commitable message without committing it.
```
$ gg l gorosgobe
$ gg sc "message -cl 189 200 -ct billgates
[gorosgobe] message. Closes #189, #200. Contributors: @billgates.    # output, not committed
```
Specifies that git should always add all files.
```
gg a
```
Acts as a logging feature. All commits are preceded by the arguments supplied after the flag in square brackets. 
```
gg l gorosgobe billgates
gg c "new commit" # commits: "[gorosgobe][billgates] new commit"
```
Delimiters can also be specified directly.
```
gg l gorosgobe -del="|" billgates
gg c "new commit" # commits: "|gorosgobe||billgates| new commit"
```
Removes the configuration file. Alternatively, it can remove any previously configured flags, such as l or pc.
```
gg r       # deletes the entire configuration
gg r l pc  # deletes configurations of l and pc flags
gg r i     # deletes all issues
```
Adds the origin attribute to the push command.
```
gg pc -o=master    # sets up the configuration
gg p                # git push origin master
gg pc -o=my-branch
gg p              # git push origin my-branch
```
Pushes to configuration branch by default. If it does not exist, pushes to master. If pushing to another branch, give as argument.
```
gg p                    # pushes to master
gg pc -o=my-branch
gg p                    # pushes to my-branch
gg p any-other-branch   # pushes to any-other-branch
gg p                    # still pushes to my-branch
```
Pulls from configuration branch by default. If it does not exist, pulls from master. If pulling to another branch, give as argument.
```
gg pl                   # pulls from master
gg plc -o=my-branch     # sets pull origin branch to be my-branch
gg pl                   # pulls from my-branch
gg pl any-other-branch  # pulls from any-other-branch
gg pl                   # still pulls from my-branch
```
Adds issue name to commit messages.
```
gg l gorosgobe
gg i -name="bugFix3" -alias=b3  # equivalent to gg i -n="bugFix3" -a=b3
gg c "commit message"           # commits: "[gorosgobe]#bugFix3 commit message"
gg i                            # sets current issue to be none
gg c "commit message"           # commits: [gorosgobe] commit message"
gg i -b3
gg c "commit message 2"         # commits: "[gorosgobe]#bugFix3 commit message 2"
```
Gives the url of the repo.
```
gg u   # equivalent of "git remote get-url origin"
```
Clones a repo.
```
gg cn <repo-url>   # equivalent of "git clone <repo-url>"
```
Fetches all.
```
gg fa                # equivalent of "git fetch --all"
```
Creates a new branch.
```
gg nb <branch-name>  # equivalent of "git checkout -b <branch-name>"
```
Checkout to a branch.
```
gg ch <branch-name>  # equivalent of "git checkout <branch-name>"
```
Deletes a branch.
```
gg d <branch-name>   # equivalent of "git branch -d <branch-name>"
```
Lists branches and current branch
```
gg b                 # equivalent of "git branch"
gg ba                # equivalent of "git branch -a"
```
Shows the current git repository status
```
gg gs                # equivalent of `git status`
```
Merges branch to current branch
```
gg m <branch-name>
```
Prints current branch
```
gg cb
```
Prints root of git repository
```
gg ro
```
