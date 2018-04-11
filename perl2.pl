@array = (1,2,3,4,5,6);
$size = @array;
print "There are $size numbers in the array\n";
print "The first 4 numbers are\n";
$i=0;
while($i<4)
{
    print ("$array[$i]\n");
    $i ++;
}

