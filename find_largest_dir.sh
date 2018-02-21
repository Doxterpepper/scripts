# recursive search for largest files on the system

function get_files() {
  path=$1
  if [ -d $path ]
  then
    echo $(du -sh $path/* | rg '^\s?.*G\s' | awk '{print $2}')
  fi
}

search() {
  path=$1
  for file in $(get_files $path)
  do
    search $file
  done
  #if [ -d $path ]
  #then
    du -sh $path
  #fi
}

search $1
