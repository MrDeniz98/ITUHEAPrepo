for file in ./output/*
do
        var_source="${file}"
        echo $var_source
        src_reg="/home/mdemirer/heap/yeni/18_haziran/other/src.reg"
        bkg_reg="/home/mdemirer/heap/yeni/18_haziran/other/bkg.reg"
        if test -f "$src_reg"; then
            echo "$src_reg exists."
        else
            echo "$src_reg does not exist."
        fi
        if test -f "$bkg_reg"; then
            echo "$bkg_reg exists."
        else
            echo "$bkg_reg does not exist."
        fi       
        var_bin_time=100
        punlearn dmstat
        dmstat "$var_source[sky=region($src_reg)][cols ccd_id]"
        var_ccd_id=`pget dmstat out_min`
        echo "CCD id: $var_ccd_id"
	
	var_output="$(basename "$var_source")"
        var_output="./lightcurve/${var_output%.fits}_output.fits"

   	punlearn dmextract
    	dmextract infile="$var_source[ccd_id=$var_ccd_id,sky=region($src_reg)][bin time=::$var_bin_time]" \
    	outfile="$var_output" \
    	bkg="$var_source[ccd_id=$var_ccd_id,sky=region($bkg_reg)]" \
    	opt="ltc1"
done
