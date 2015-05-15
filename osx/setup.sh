OSX=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT=`dirname $OSX`

bash $OSX/defaults.sh
bash $OSX/symlinks.sh

LINUX="$ROOT/linux/*"

# dynamically rewrite .bash_profile with absolute paths to .*.sh files
# ex: bash/.alias.sh
for script in "$ROOT"/*/*.bash ; do
  # ignore scripts for other os
  if ! [[ $script =~ $LINUX ]] ; then
    printf "\nsource \"$script\"" >> ~/.bash_profile
  fi
done