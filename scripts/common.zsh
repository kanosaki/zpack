
git_sync () {
  local git_url=$1
  local git_repo=$2
  if [[ -d $git_repo/.git ]]; then
    local prevdir=$(pwd)
    cd $git_repo
    git pull --ff --all
    cd $prevdir
  else
    git clone --recursive $git_url $git_repo
  fi
}
