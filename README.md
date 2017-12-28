# git-fast

A script that allows to save configurations for easier, more meaningful and faster comitting.

# Features
```
Commits with the current message
git-fast -c            # extracts message from configuration 
git-fast -c "message"  # adds message to configuration
```
Shows the current message/template to commit
```
git-fast status
git-fast -s
```
Specifies that git should always add all files
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
Removes the configuration file. Alternatively, it can remove any previously configured flags, such as -l or -p
```
git-fast -r # deletes the entire configuration
git-fast -r -l -p # deletes configurations of -l and -p flags
```
Adds the origin attribute to the push command.
```
git-fast -p --o=master    # sets up the configuration
git-fast -pf              # git push origin master
git-fast -p --o=my-branch
git-fast -pf              # git push origin my-branch

```
