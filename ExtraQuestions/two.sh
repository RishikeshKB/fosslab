if [ $1 -gt $2 ]
then
  if [ $1 -gt $3 ]
  then
    l=$1
  else
   l=$3
  fi
elif [ $2 -gt $3 ]
then 
  l=$2
else
 l=$3
fi
echo "The largest number is : $l";

