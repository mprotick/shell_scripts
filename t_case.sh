# if there is no argument

if  [ -z $1 ]
then
switch="no arg"
elif [ -n $1 ]
then 
switch=$1  #take 1st argument as switch
fi

case $switch in
"loop") for ((i=0; i<5; i++))
        do
        echo $i
        done;;
"no arg")
        echo "No argument is given to shell script" $0;;
"plot") gnuplot t_gnu;;
*)      echo "This is default";;
esac 
