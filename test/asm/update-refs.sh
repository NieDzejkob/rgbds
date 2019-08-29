#!/bin/sh
fname=$(mktemp)

for i in *.asm; do
	../../rgbasm $i >$fname 2>&1
	mv -f $fname ${i%.asm}.out

	cat $i | ../../rgbasm - >$fname 2>&1
	mv -f $fname ${i%.asm}.out.pipe
done

rm -f $fname
exit 0
