# git-fast

A script to allow for more useful git commit messages.

# Features
```
Commits with the current message
git-fast -c            # extracts message from configuration 
git-fast -c "message"  # adds message to configuration
```
Shows the current message/template to commit
```
git-fast status
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
