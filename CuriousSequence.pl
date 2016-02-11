
$n = 4;

$start_run = time();

$filename2 = 'C:\Users\CuriousSequence.txt';
open( $out, '>>', $filename2) or die "Could not open file '$filename2' $!";

# setup the loop upper limit so that all possible diget combinations can be checked.
$x = int('1' . '0' x ($n + 1));
$ULimit = $x;
$parm = "%" . $n  . "d";

print $out "\n\n" . "n=" . $n .   "  Upper Limit=" . $ULimit . "\n";
print "\n\n" . "n=" . $n .   "  Upper Limit=" . $ULimit . "\n";

$i = 1;
while ($i < $ULimit)
{
   # pad with leading zeros
   $num = sprintf($parm, $i);
   $num=~ tr/ /0/;
   
   @num_array = split //, $num;
   $i2 = 0;
   $sum = 0;
   $StringHasNumberBiggerThanN = 0;

   # sum up all digits in the array
   while ($i2 < $n + 1)
   {
      if  (  $num_array[$i2] > $n   )
      {
         $StringHasNumberBiggerThanN = 1;
      }
      $sum = $num_array[$i2] + $sum;
      $i2++;
   }

   # check if sum of all digits equals n+1 AND each individual digit is less than n
   if ($sum == $n + 1  && $StringHasNumberBiggerThanN == 0 )
   {
       $count_result = '';
       @count_array;
       $i2 = 0;
       
       # count the number of each digit
       while ($i2  < $n + 1 )
       {
          $x = $i2;
          $y = $num;
          $result = () = $y =~ /$x/g;
          $count_result = $count_result .  $result;
          $i2++;
       }
       
       # check if diget count equals the orginal number; if it does we have a curious sequence
       if ($num == $count_result)
       {
       print $out "Curious Sequence Identified for N=$n: $num         $sum $count  count result: $count_result     \n \n";
       }
   }
 $i++ ;
 
 $mod = $i  % 1000000;
 if ($mod == 0)
 {
    $run_time = time - $start_run;
    print $out $i . " elapsed time: " . $run_time .    "\n";
    print $i . " elapsed time: " . $run_time . " seconds   " .  ($i /$ULimit) * 100 .  "%   \n";
 }
 
}



$run_time = time - $start_run;
print $out "Job took $run_time seconds\n";
