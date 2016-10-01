#!/usr/bin/env zsh

HOSTS=()

while [[ $# -ge 1 ]] ; do
  key="$1"
  case $key in
    -l|--level)
      LEVEL="$2"
      shift
      ;;
    *)
      HOSTS=($HOSTS "$key")
      ;;
  esac
  shift
done

if [[ -z $HOSTS ]]; then
  echo "hosts requried"
  exit -1
fi

if [[ -z $LEVEL ]]; then
  LEVEL=default
fi


fab -H ${(j:,:)HOSTS} do_deploy:deploy_dir=levels/$LEVEL
