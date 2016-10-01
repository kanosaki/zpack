#!/usr/bin/env zsh

if [[ -z $1 ]]; then
  echo "Usage: $0 <levelname>"
  exit -1
fi

export APP_BASE="${${(%):-%N}:A:h:h}"

LEVEL=$1
LEVEL_DIR=$APP_BASE/levels/$LEVEL
PACKAGE_LSIT=$LEVEL_DIR/packages.txt

source $APP_BASE/scripts/common.zsh

if [[ ! -f $PACKAGE_LSIT ]]; then
  echo "Package list: $PACKAGE_LSIT not found"
fi

export PACKAGES_DIR=$APP_BASE/packages
export PACKDIR=${${ZPACK_PACKDIR}:-${APP_BASE}/.dist}
export HOOK_DIR=${${ZPACK_HOOK_DIR}:-${PACKDIR}/_hooks}
export HOOK_ORDER=${${ZPACK_HOOK_ORDER}:-${PACKDIR}/_order.txt}

PACKED_MARK_DIR=$APP_BASE/.pack-mark

rm -rf $PACKED_MARK_DIR
rm -rf $HOOK_DIR
mkdir -p $PACKDIR
mkdir -p $PACKED_MARK_DIR

mkdir -p $HOOK_DIR/install
mkdir -p $HOOK_DIR/post_install
mkdir -p $HOOK_DIR/pre_install
mkdir -p $HOOK_DIR/post_pack

rm -f $HOOK_ORDER
touch $HOOK_ORDER

_register_hook_script() 
{
  local package_dir=$1
  local hook_type=$2
  local package_name=$3
  local install_path=$HOOK_DIR/$hook_type/$package_name.sh
  if [[ -f $package_dir/$hook_type.sh ]]; then
    if [[ -e $install_path ]]; then
      echo "WARNING: Hook already exists: $install_path"
    fi
    cp $package_dir/$hook_type.sh $install_path
  fi
}

register_hooks() 
{
  local package_dir=$1
  local script_name=$(basename $package_dir)  # extracts package name
  echo $script_name >> $HOOK_ORDER

  _register_hook_script $package_dir install $script_name
  _register_hook_script $package_dir pre_install $script_name
  _register_hook_script $package_dir post_install $script_name
}

process_package()
{
  local package_name=$1
  local mark_file=$PACKED_MARK_DIR/$package_name
  local package_dir=$PACKAGES_DIR/$package_name
  if [[ -e ${mark_file} ]]; then
    return
  fi
  if [[ -e ${mark_file}.pre_install ]]; then
    echo "WARNING: Circular dependency at $package_name skipping." >&2
    return
  fi
  touch ${mark_file}.pre_install
  if [[ -f $package_dir/depends.txt ]]; then
    (install_packagelist $package_dir/depends.txt)
  fi

  echo Packing $package_name

  # install body
  if [[ -f $package_dir/pack.zsh ]]; then
    cd $package_dir
    source $package_dir/pack.zsh
    cd $APP_BASE
  else
    cp -R $package_dir $PACKDIR/$package_name
  fi
  if [[ -f $package_dir/post_pack.zsh ]]; then
    cp $package_dir/post_pack.zsh $HOOK_DIR/post_pack/$package_name.zsh
  fi
  if [[ -f $package_dir/install.sh  || -f $package_dir/pre_install.sh || -f $package_dir/post_install.sh ]]; then
    register_hooks $package_dir
  fi
  touch ${mark_file}
  rm -f ${mark_file}.pre_install
}

install_packagelist()
{
  while IFS= read -r package_name ; do
    local package_dir=$PACKAGES_DIR/$package_name
    if [[ ! -d $package_dir ]]; then
      echo Package $package_dir not found
      exit -1
    fi
    process_package $package_name
  done < $1
}

process_package bootstrap
install_packagelist $PACKAGE_LSIT

do_post_pack()
{
  setopt nonomatch
  for script in $HOOK_DIR/post_pack/*.zsh; do
    echo Post pack $(basename $script)
    chmod +x $script
    exec $script
  done
}

(cd $PACKDIR; do_post_pack)

