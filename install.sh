install_path=/usr/local/bin

bash_files=(mux.sh rand_cowsay.sh git-sub-status.sh cbranch.sh)

# Install scripts that use bash
function bash_installs {
  for file in ${bash_files[@]}
  do
    echo $file
    chmod +x $file
    # remove file extension
    fn=$(echo $file | sed 's/\..*//')
    ln $file $install_path/$fn
  done 
}

bash_installs

