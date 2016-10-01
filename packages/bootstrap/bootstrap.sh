#!/bin/bash

# $BASE_DIR must set by fabric script
if [[ -z $BASE_DIR ]]; then
  export BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

kick_hook()
{
  hook_type=$1
  while IFS= read -r script_name ; do
    script_path=$BASE_DIR/_hooks/$hook_type/$script_name.sh
    if [[ -f $script_path ]]; then
      echo Running $hook_type action of $script_name...
      chmod +x $script_path
      $script_path
    fi
  done < $BASE_DIR/_order.txt
}

kick_hook pre_install 
kick_hook install 
kick_hook post_install

echo Bootstrap done!
