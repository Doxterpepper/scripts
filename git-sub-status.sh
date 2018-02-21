# The CATS framework is a git repository with several git repositories inside it.
# This script was supposed to help figure out if I have accidently changed anything
# in one of those sub repositories.
#echo $(pwd)
git status

if [ -e */ ]
then
  for dir in $(ls -d */)
  do
    cd $dir
    if [ -e .git ]
    then
      echo "here"
      #echo $dir
      git status
    fi
    cd -
    echo
  done
fi
