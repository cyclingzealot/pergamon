#!/usr/bin/env bash

START=$(date +%s.%N)

#Set the config file
configFile='~/.pergamon/config'

#exit when command fails (use || true when a command can fail)
set -o errexit

#exit when your script tries to use undeclared variables
set -o nounset

#(a.k.a set -x) to trace what gets executed
#set -o xtrace

# in scripts to catch mysqldump fails 
set -o pipefail

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
ts=`date +'%Y%m%d-%H%M%S'`


#Capture everything to log
log=~/log/$__base-${ts}.log
exec >  >(tee -a $log)
exec 2> >(tee -a $log >&2)


#Check that the config file exists
#if [[ ! -f "$configFile" ]] ; then
#        echo "I need a file at $configFile with ..."
#        exit 1
#fi


echo Begin `date`  .....

### BEGIN SCRIPT ###############################################################

mkdir -p ~/.pergamon
lsListe=~/.pergamon/filesByModificationDate
trouveProfMax=0
pasTrouvePlus=0

lsMax=`getconf ARG_MAX`

trouveDernierePasse=0
profondeur=0
facteur=1

find ~ -printf '%T+ %p\n' | sort -r > $lsListe


#while [ "$trouveProfMax" -eq 0 -a "$pasTrouvePlus" -eq 0 ]; do
#
#    fichiersTrouve=`find ~ -maxdepth $profondeur | wc -c`
#	echo "Arguement $fichiersTrouve chars at a depth of $profondeur"
#
#    if [ "$trouveDernierePasse" -gt 5 ]; then
#        let "facteur = $fichiersTrouve / $trouveDernierePasse"
#		facteur=`echo "scale=2; $fichiersTrouve / $trouveDernierePasse" | bc`
#	fi
#
#
#    trouveProfMax=`echo "scale = 2; $facteur * $trouveDernierePasse > $lsMax" | bc `; 
#
#	# LOOP END
#	if [ "$trouveDernierePasse" -eq "$fichiersTrouve" ]; then
#		pasTrouvePlus=1;
#	fi
#
#    let "profondeur = $profondeur + 1" || true;
#	trouveDernierePasse=$fichiersTrouve
#
#done


### END SCIPT ##################################################################

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo Done.  `date` - $DIFF seconds
