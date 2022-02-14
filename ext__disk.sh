#!/bin/bash
echo -n "Deseja montar o disco externo do timeshift (y/n)"
read -r EXT_timeshift 

if test "y" = "$EXT_timeshift"

    then 
    #sudo mount /dev/sdd7 /mnt/EXT__ST500LM012_BK_TIMESHIFT/
    echo "EXT__ST500LM012_BK_TIMESHIFT está montado!"

elif test "n" = "$EXT_timeshift"
    
    then
    #sudo umount /dev/sdd7 /mnt/EXT__ST500LM012_BK_TIMESHIFT/ -l
    echo "EXT__ST500LM012_BK_TIMESHIFT não montado!"

elif test "y" || "n" != "$EXT_timeshift"
    then
    echo 'invalid arguments!'

fi

echo "Deseja montar o disco externo do clonezilla? (y/n)"
read -r EXT_clonezilla

if test "y" = "$EXT_clonezilla"

    then
        #sudo mount /dev/sdd6 /mnt/EXT__ST500LM012_CLONEZIBK__RAID/ 
        echo "EXT__ST500LM012_CLONEZIBK__RAID está montado!"
    
    
    elif test "n" = "$EXT_clonezilla"
        then
            #sudo umount /dev/sdd6 /mnt/EXT__ST500LM012_CLONEZIBK__RAID/ -l
            echo "EXT__ST500LM012_CLONEZIBK__RAID foi desmontado"

    elif test "y" || "n" != "$EXT_clonezilla"
    then
    echo 'invalid arguments!'


fi










#elif test "n" = "$question

#then
#	echo -n "Deseja mountar o disco externo do  clonezilla? (y/n)"   
#read question


   


