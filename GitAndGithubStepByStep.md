##open git

##run 
git init

##change directory
cd ~/datasciencecoursera
cd ..

##create a file
touch GitAndGithubStepByStep.md

##edit file
[via notepad++ or editor]

#add file
git add GitAndGithubStepByStep.md

#commit changes and comments
git commit -m "add steps to file"

##verify everithing is in order
git -v

##push to sync
git push
git push origin master

#common errors
master ( git ) is not in sync with origin ( github ).
##Sync the repositories
git fetch origin
git merge origin/master

#push the changes back to github
$git push origin master

---------------
##Help
https://help.github.com/