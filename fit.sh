count=1
for ((i=8; i<12; i++))
do
awk  '{gsub("8","'"$i"'",$2); print $0}' fit_gnu.do > tt.$count
gnuplot tt.$count
count=`expr $count + 1`
done

awk '{if($1=="Final") print NR+4}' fit.log > tmp1
n=`awk 'END{print NR}' tmp1`
echo $n

for ((i=1; i<=$n; i++))
do
m=`awk 'NR=="'$i'"{print $1}' tmp1`
awk 'NR=="'$m'"{print $3,"\t"$5}' fit.log > tmp2.$i
#echo $m
echo $i > tmp3.$i
done

cat tmp2.* > tmp2
cat tmp3.* > tmp3

paste tmp3 tmp2 > jk-cor-mass

rm -f tmp1 tmp2* tmp3* fit.log


#rm -f tt.*
