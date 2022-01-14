#!/bin/bash
#
# Run this to replace all occurences of XXTEMPLATEXX with the name of the folder this script is in

REPO=$(basename "$(pwd)")
echo "Please create GitHub repo '$REPO'..."
read -r

# Replace every occurence in files
grep -rl XXTEMPLATEXX . --exclude-dir="\.git/" | xargs sed -i "s/XXTEMPLATEXX/$REPO/g"

# Move default workflow (TODO: don't hardcode path)
mv .github/workflows/XXTEMPLATEXX.yml .github/workflows/$REPO.yml

# Remove this script
rm "$0"

# Move to main branch and amend changes, then delete cpp branch and push
git remote set-url origin "git@github.com:anarchuser/$REPO.git"
git add .
git commit --amend -m "chore: instantiate template to this repository"

echo "Force-pushing to '$REPO'. ENTER to proceed, CTRL-C to cancel:"
read -r
git push -u origin main --force

echo "Done"
