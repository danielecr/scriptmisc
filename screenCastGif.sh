#! /bin/bash

D=$1
if [ "$D" = "" ]; then
    D=20
fi
INFOS=`xwininfo | awk '/\ \ A/{print $4} /\ \ [WH]/{print $2} '`

#read -r X Y W H lll vo cc <<<$`xwininfo | awk '/\ \ A/{print $4} /\ \ [WH]/{print $2} '`

read -r X Y W H lll vo cc <<<$(echo $INFOS)
echo 'x:' $X 'y:' $Y 'width:' $W 'height:' $H 'time:' ${D}s

function findTarget {
    local CNT=
    local TARGET=~/Desktop/screencast${CNT}.gif

    while [ -e $TARGET ]; do
	if [ "$CNT" == "" ]; then
	    CNT=0
	fi
	CNT=$[CNT+1]
	TARGET=~/Desktop/screencast_${CNT}.gif
    done
    echo $TARGET
}

TARGET=$(findTarget)


byzanz-record -x $X -y $Y -w $W -h $H -d $D $TARGET
