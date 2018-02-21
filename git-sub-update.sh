pwd
git pull origin master
echo

for dir in $(ls -d */)
do
  echo $dir
  cd $dir
  git pull origin master
  cd -
  echo
done
