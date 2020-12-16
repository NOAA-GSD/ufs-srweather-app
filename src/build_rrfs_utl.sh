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

cd rrfs_utl

if [ "$target" = "jet" ] || [ "$target" = "hera" ] ; then
  ./build.rrfs_utl
else
    echo WARNING: UNKNOWN PLATFORM 1>&2
fi

