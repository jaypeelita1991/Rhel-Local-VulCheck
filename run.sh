#!/bin/bash
ls cve|
	while read script;
do
	bash ./cve/$script
done
#######

