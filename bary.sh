
#!/bin/bash 

#change dir_obs and dir_repro only and create bary and output folders

dir_obs=/home/obsdata/chandra/sn87a  #directory of original obs files (before repro)
dir_repro=/home/mdemirer/heap/yeni/18_haziran/other #directory of reprocessed obs files

rm -r $dir_repro/bary/*
rm -r $dir_repro/output/*

for var_source1 in $dir_obs/*
do
	var_folder1=${var_source1##*/}

	echo "-------------------------------------------"
	echo "$var_folder1 1" 
	echo "-------------------------------------------"

	mkdir $dir_repro/bary/$var_folder1/
	cp $var_source1/primary/orbit* $dir_repro/bary/$var_folder1/
done

for var_source2 in $dir_repro/*
do
	var_folder2=${var_source2##*/}

	echo "-------------------------------------------"
	echo "$var_folder2 2"
	echo "-------------------------------------------"
	
	cp $var_source2/*evt2.fits* $dir_repro/bary/$var_folder2/

	axbary  $dir_repro/bary/$var_folder2/*evt2.fits $dir_repro/bary/$var_folder2/orbit* $dir_repro/output/${var_folder2}_bary.fits 75.5912 -68.7302	   
done 

echo "-------------------------------------------"
echo "Barycenter correction finished."
echo "-------------------------------------------"

