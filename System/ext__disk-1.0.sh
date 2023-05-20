#!/bin/bash


 ############################
 # EXT@ST500LM012_S #
 ############################

echo -n "Montar o disco EXT@ST500LM012__STORAGE ? (y/n) "
read -r EXTST500LM012__STORAGE

if test "y" = "$EXTST500LM012__STORAGE"

    then 
    sudo mount /dev/sdc4 /mnt/EXT@ST500LM012__STORAGE/
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

elif test "n" = "$EXTST500LM012__STORAGE"
    
    then
    sudo umount /dev/sdc4 /mnt/EXT@ST500LM012__STORAGE/ -l
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXTST500LM012__STORAGE"
    then
    echo 'invalid arguments!'

fi


################################
# EXT@ST500LM012_R #
################################

echo -n "Montar o disco EXT@ST500LM012__CLONRAID ? (y/n) "
read -r EXTST500LM012__CLONRAID

if test "y" = "$EXTST500LM012__CLONRAID"

    then 
    sudo mount /dev/sdc3 /mnt/EXT@ST500LM012__CLONRAID/
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

elif test "n" = "$EXTST500LM012__CLONRAID"
    
    then
    sudo umount /dev/sdc3 /mnt/EXT@ST500LM012__CLONRAID/ -l
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXTST500LM012__CLONRAID"
    then
    echo 'invalid arguments!'

fi