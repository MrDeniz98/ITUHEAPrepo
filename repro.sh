#!/bin/bash

#rm -r /home/mdemirer/heap/yeni/14_haziran/*

for var_source in /home/sinem/obsdata/chandra/sn87a/*
do
	var_folder=${var_source##*/}

	echo "-------------------------------------------"
	echo "$var_folder"
	echo "-------------------------------------------"
	
	mkdir /home/sinem/18_haziran/$var_folder
        chandra_repro indir="$var_source" outdir=/home/sinem/18_haziran/$var_folder      
done 

