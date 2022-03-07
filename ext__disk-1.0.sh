#!/bin/bash
echo -n "Montar o disco EXT__ST500LM012_RAID__BK? (y/n) "
read -r EXT__ST500LM012_RAID__BK

if test "y" = "$EXT__ST500LM012_RAID__BK"

    then 
    sudo mount /dev/sdd5 /mnt/EXT__ST500LM012_RAID__BK/
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

elif test "n" = "$EXT__ST500LM012_RAID__BK"
    
    then
    sudo umount /dev/sdd5 /mnt/EXT__ST500LM012_RAID__BK/ -l
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXT__ST500LM012_RAID__BK"
    then
    echo 'invalid arguments!'

fi

echo "Montar o disco externo do EXT__ST500LM012_TIMESHIFT__BK? (y/n)"
read -r EXT__ST500LM012_TIMESHIFT__BK

if test "y" = "$EXT__ST500LM012_TIMESHIFT__BK"

    then
        sudo mount /dev/sdd6 /mnt/EXT__ST500LM012_TIMESHIFT__BK/
        echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'
    
    
    elif test "n" = "$EXT__ST500LM012_TIMESHIFT__BK"
        then
            sudo umount /dev/sdd6 /mnt/EXT__ST500LM012_TIMESHIFT__BK -l
            echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

    elif test "y" || "n" != "$EXT__ST500LM012_TIMESHIFT__BK"
    then
    echo 'invalid arguments!'


fi










#elif test "n" = "$question

#then
#	echo -n "Deseja mountar o disco externo do  clonezilla? (y/n)"   
#read question


   


