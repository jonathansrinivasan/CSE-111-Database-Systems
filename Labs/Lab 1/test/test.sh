#!/bin/bash

rm -f score.res
rm -f data/tpch.sqlite
touch data/tpch.sqlite

score=0
qnum=1

for (( i=1; i<=$qnum; i++ ))
do
	sqlite3 data/tpch.sqlite < create-schema-tpch.sql
	sqlite3 data/tpch.sqlite < test/$i.sql > output/$i.out
	diff -w output/$i.out results/${i}.res > /dev/null
	if [ $? -eq 0 ]
	then
		echo "Query $i: PASS"
		echo "1" >> score.res
		score=$((score+1))
	else
		echo "Query $i: FAIL"
		echo "0" >> score.res 
	fi
done

if [ $score -ne $qnum ] ; then
	echo "Some queries failed. Check score.res"
	exit 1
else
	echo "All queries passed. Good job!!!"
	exit 0
fi
