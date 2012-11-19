#!/bin/bash

CUE_FILE=$(basename "$1")
PRFX_NAME=${CUE_FILE%.[cC][uU][eE]}
FLA_FILE=$(find . -type f -iname "$PRFX_NAME.flac")

recode 1251..utf8 < "$CUE_FILE" > tmp.cue

shnsplit -i flac -o 'flac flac -V -8 -e -p -o %f -' -t %n "$FLA_FILE" < tmp.cue

for (( i=1 ; i <= $(cueprint -d '%N' tmp.cue) ; ++i )) ; do
    NN=$(printf '%02d' $i)
    [ -s "$NN.flac" ] && { 
        cueprint -n $i -t 'ARRANGER=%A\nCOMPOSER=%C\nGENRE=%G\nMESSAGE=%M\nTRACKNUMBER=%n\nARTIST=%p\nTITLE=%t\nALBUM=%T\n' tmp.cue |
        egrep -v '=$' |
        metaflac --import-tags-from=- $NN.flac
        mv $NN.flac "$NN - `cueprint -n $i -t %t tmp.cue`.flac"
    }
done

rm tmp.cue
