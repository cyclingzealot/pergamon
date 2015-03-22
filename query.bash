#Take oldest file

#For current file and stop=no
	#Ask if you want to delete it
		If yes 
			if file, do so 
			if dir, move to tmp dir
		If not, add to exception list
		if stop, set stop=yes
		if up, continue

	curentFile=basedir CurrentFile	

#Repeat until you reach home dir
