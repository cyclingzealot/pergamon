#!/bin/bash

lsListe=~/.pergamon/filesByModificationDate

#If last query was after minimumBreak, exit

### First find a file to delete
#Take oldest file 
	#If in exception list or does not exist remove entry from $lsListe
#Repeat until found

### Now ask what you want to do with it and 
#Ask if you want to delete it
#repeat until y or n

if yes, mode = delete
if no mode = keep (add to exception list)

$currentFile=file

Ask if you want to keep|delete something further up?
	if yes, currentFile=dirname $file
	Repeat

If no, 
	If mode=delete, 
		move $currentFile into pergamon/attick
		Ask if you wish to delete right away
	If no=keep
		Add $currentFile to exceptionList


