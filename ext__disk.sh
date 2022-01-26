#!/bin/bash
echo -n "Deseja montar o disco externo do timeshif (y/n)"
read question 

if test "y" = "$question"
then 
   sudo mount /dev/sdd7 /mnt/EXT__ST500LM012_BK_TIMESHIFT/
   echo "EXT__ST500LM012_BK_TIMESHIFT está montado!"
else 
   sudo umount /dev/sdd7 /mnt/EXT__ST500LM012_BK_TIMESHIFT/ -l
   #echo "EXT__ST500LM012_BK_TIMESHIFT foi desmontado!"

fi



echo "Deseja montar o dosco externo do clonezilla? (y/n)"
read question2

if test "y" = "$question2"
then
    sudo mount /dev/sdd6 /mnt/EXT__ST500LM012_CLONEZIBK__RAID/ 
    echo "EXT__ST500LM012_CLONEZIBK__RAID está montado!"
else
    sudo umount /dev/sdd6 /mnt/EXT__ST500LM012_CLONEZIBK__RAID/ -l
    #echo "EXT__ST500LM012_CLONEZIBK__RAID foi desmontado"
fi










#elif test "n" = "$question

#then
#	echo -n "Deseja mountar o disco externo do  clonezilla? (y/n)"   
#read question


   


