bash_files=(mux.sh rand_cowsay.sh)
install_path=/usr/local/bin

for file in ${bash_files[@]}
do
  echo $file
  chmod +x $file
  # remove file extension
  fn=$(echo $file | sed 's/\..*//')
  ln $file $install_path/$fn
done
