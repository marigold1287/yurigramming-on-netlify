#!bin/bash

cd `dirname $0`

git add .

if [ $# = 0 ]; then
    COMMENT=`date +%Y%m%d%H%M%S`
else
    COMMENT=$1
fi

git commit -m ${COMMENT}

git push origin main
