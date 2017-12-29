# git-fast

A script that allows to save configurations for easier, more meaningful and faster comitting.

# Features
Commit the current message and push.
```
git-fast -c            # extracts message from configuration 
git-fast -c "message"  # adds message to configuration
git-fast -c "message" -cl 189 200 -ct gorosgobe
# commits: "message. Closes #189, #200. Contributors: @gorosgobe."
git-fast -pf
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
Removes the configuration file. Alternatively, it can remove any previously configured flags, such as -l or -p.
```
git-fast -r       # deletes the entire configuration
git-fast -r -l -p # deletes configurations of -l and -p flags
git-fast -r -i    # deletes all issues
```
Adds the origin attribute to the push command.
```
git-fast -p --o=master    # sets up the configuration
git-fast -pf              # git push origin master
git-fast -p --o=my-branch
git-fast -pf              # git push origin my-branch
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
