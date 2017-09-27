#! /bin/bash

D=$1
if [ "$D" = "" ]; then
    D=20
fi
INFOS=`xwininfo | awk '/\ \ A/{print $4} /\ \ [WH]/{print $2} '`

#read -r X Y W H lll vo cc <<<$`xwininfo | awk '/\ \ A/{print $4} /\ \ [WH]/{print $2} '`

read -r X Y W H lll vo cc <<<$(echo $INFOS)
echo 'x:' $X 'y:' $Y 'width:' $W 'height:' $H 'time:' ${D}s


byzanz-record -x $X -y $Y -w $W -h $H -d $D /tmp/amazonclic.gif
