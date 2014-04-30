#Update a file
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

-----------------------------
#Fork a repo
use Fork button
clone repo ( to your current directory)
	git clone https://github.com/your-user-name-goes-here/repor-name-here.git
---------------------
#git 
##dir commands
Move to the sybase folder
$ cd /usr/local/sybase
$ pwd
/usr/local/sybase

Change to another folder
$ cd /var/log
$ pwd
/var/log

Quickly get back
$ cd - 
$ pwd
/usr/local/sybase

move up one folder
$ cd ..
$ pwd
/usr/local/

$ cd (Back to your home folder)
-------------------
## Data Science Specialization (secondary header )

* Uses R (unordered list)
* Nine courses 
* Goes from raw data to data products
