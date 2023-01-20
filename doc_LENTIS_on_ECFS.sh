#!/bin/bash


#-------------------
# script to write out LENTIS details on ECFS
#-------------------


for freq in AERmon Amon Emon LImon Lmon Ofx Omon SImon fx Eday Oday day CFday 3hr 6hrPlev 6hrPlevPt; do
  for scen in hxxx sxxx; do
    els -l ec:/nklm/LENTIS/ec-earth/cmorised_by_var/${scen}/${freq}/* >> LENTIS_on_ECFS_${scen}_${freq}.txt
  done
done
