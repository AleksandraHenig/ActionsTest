oldCommit=$1
newCommit=$2

echo 'User Stories: '
git log $oldCommit..$newCommit --no-merges --pretty=format:"%h - %ae, %s" | grep -oP --regexp="($3-\d+)" | sort -r | uniq
echo ''
echo 'Commits: '
echo '{Commit hash} – {Author email} – {Commit Message}'
echo ''
 
git log $oldCommit..$newCommit --no-merges --pretty=format:"%h - %ae, %s"