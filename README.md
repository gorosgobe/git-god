# git-god

A script that allows to save configurations for easier, more meaningful, faster and safer comitting and pushing. 

git-god allows to set suites of scripts running before every push i.e. preventing pushes that break test cases. It also provides utilities to configure pulling and pushing to/from branches, commit messages that are clearer and faster, and gives shortcuts for frequently used git commands.

# Install
Make sure you have Ruby installed. If you don't, follow the instructions go to https://www.ruby-lang.org/en/documentation/installation/.

Add the following line to the bottom of your ~/.bashrc file:
```
export PATH=$PATH:<path-to-repo>
```
If you wish to feel even more like a god, add the following line too:
```
alias g='gg'
```

# Extensibility - adding your own commands.
git-god is a tool that can be extended really easily. In order to add your own commands, you need to create a subclass of the BaseCommand class (in lib/), defining the execute() method. Then, put your file in the custom/ directory, and git-god will load it automatically each time it runs. As simple as that.

For an example of how to implement such commands see the "gg ig <file-name>" command in the custom/ directory, which allows the user to add files to their .gitignore file. 

# Features
The following are the features currently supported by git-god.

Commit the current message and push.
```
gg c "message"  # commits formatting with the configuration
gg c "message" -cl 189 200 -ct gorosgobe
# commits: "message. Closes #189, #200. Contributors: @gorosgobe."
gg p
gg cp "message" # commits same as first command but also pushes to 
                # configuration branch or master. See gg p below
```
Make a long commit, with information per file.
```
gg lc
--Long commit mode--

Files changed: 
gg

Enter the commit message associated with each file:
gg: Added template message
Additional flags: -ct gorosgobe

gg: Added template message

Contributors: @gorosgobe.      # Commits the last three lines.
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
Saves a script/command in configuration. These will run before pushing anything, when executing commands such as "gg cp", "gg c" or "gg prcp". If any of such scripts/commands reports a non-zero exit code, nothing will be pushed. Note that aliases will not work when running these scripts/commands and that script names given to the command must be relative to the root directory of the git repository.
gg r scr removes all scripts from the configuration file
```
gg scr ls -a             # same as gg script ls -a
gg scr gg gs             # note that in case we have an alias such as g='gg',
                         # we would still need to do "g scr gg gs" 
gg scr ./dir1/hello 35   # executing the script in <root-git-repo>/dir1 of 
                         # name hello with argument 35

# if we now call "gg p" for example, the three scripts above will be called in that order.
# if all of them succeed, gg will push to master.
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
gg c "commit message"           # commits: "[gorosgobe] commit message"
gg i -b3
gg c "commit message 2"         # commits: "[gorosgobe]#bugFix3 commit message 2"
```
Opens the configuration file in vim.
```
gg op
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
Lists branches and current branch.
```
gg b                 # equivalent of "git branch"
gg ba                # equivalent of "git branch -a"
```
Shows the current git repository status.
```
gg gs                # equivalent of "git status"
```
Merges branch to current branch.
```
gg m <branch-name>   # equivalent of "git merge <branch-name>"
```
Prints current branch.
```
gg cb                # equivalent of "git rev-parse --abbrev-ref HEAD"
```
Prints root of git repository.
```
gg ro                # equivalent of "git rev-parse --show-toplevel"
```
Adds a file to the .gitignore file. If the .gitignore file does not exist, creates a new one.
```
gg ig <file-name>
```
