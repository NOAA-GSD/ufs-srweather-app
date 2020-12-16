#! /usr/bin/env bash
set -eux

source ./machine-setup.sh > /dev/null 2>&1
cwd=`pwd`

USE_PREINST_LIBS=${USE_PREINST_LIBS:-"true"}
if [ $USE_PREINST_LIBS = true ]; then
  export MOD_PATH=/scratch3/NCEPDEV/nwprod/lib/modulefiles
else
  export MOD_PATH=${cwd}/lib/modulefiles
fi

cd gsi

if [ "$target" = "jet" ] ||  [ "$target" = "hera" ] ; then
  ./ush/build.comgsi
else
    echo WARNING: UNKNOWN PLATFORM 1>&2
fi
