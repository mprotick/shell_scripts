# script for calculating effective mass for a single 
# configuration

echo "Input <nt>"
read nt
n=`expr $nt - 1`

for ((i=1; i<=$n; i++))
do 
a=`awk 'NR=="'"$i"'" {print $3}' ps9632 `
j=`expr $i + 1`
b=`awk 'NR=="'"$j"'" {print $3}' ps9632 `

echo $a
echo $b
echo $a $b |awk '{print log($1/$2)}' > c.$i 

done

cat c.* > c_no_serial
awk '{print NR,"\t" $1}' c_no_serial > ps9632sh
rm c*
