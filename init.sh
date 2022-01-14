#!/bin/bash
#
# Run this to replace all occurences of XXTEMPLATEXX with the name of the folder this script is in

REPO=$(basename `pwd`)
echo "Initialising this repository as '$REPO'"

# Replace every occurence in files
grep -rl XXTEMPLATEXX . --exclude-dir="\.git/" | xargs sed -i "s/XXTEMPLATEXX/$REPO/g"

# Move default workflow (TODO: don't hardcode path)
mv .github/workflows/XXTEMPLATEXX.yml .github/workflows/$REPO.yml

# Remove this script
rm $0

# Move to main branch and amend changes, then delete cpp branch and push
git add .
git commit --amend --no-edit
git push -u origin main --force-with-lease
