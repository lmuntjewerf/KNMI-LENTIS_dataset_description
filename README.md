# KNMI-LENTIS dataset description

TODO Update link to Zenodo dataset


## **1. Description** 

This Git repository pertains to the full KNMI-LENTIS dataset: a large ensemble of global climate model simulations with EC-Earth3 for the present-day period (2000-2009) and a future +2K period (2075-2084 following SSP2-4.5). KNMI-LENTIS has 1600 simulated years for both the two climates. This level of sampled climate variability allows for robust and in-depth research into extreme events. The total size of KNMI-LENTIS is 128 TB. KNMI-LENTIS is stored at the [high performance storage system of the ECMWF (ECFS)](https://www.ecmwf.int/en/computing/our-facilities/data-handling-system). 

The goal of this repository is :

1.  to provide an accurate description and example of how the KNMI-LENTIS dataset is organised. 
2.  to describe in which servers the data are deposited and how to gain access to the data for future users
3.  to provide links to related git repositories and other content relating to the KNMI-LENTIS production

## **2. Description of how KNMI-LENTIS is organised**

KNMI-LENTIS consists of 2 times 160 runs of 10 years. All simulations have a unique ensemble member label that reflects the forcing, and how the initial conditions are generated. The initial conditions have two aspects: the parent simulation from which the run is branched (macro perturbation, there are 16), and the seed relating to a particular micro-perturbation in the initial three-dimensional atmosphere temperature field (there are 10). The ensemble member label thus is a combination of: 

-   forcing (_h_ for present-day/historical and _s_ for +2K/SSP2-4.5)
-   parent ID (number between 1 and 16)
-   micro perturbation ID (number between 0 and 9)

In the companion [Zenodo dataset]|() we publish 1 year from 1 member to give insight into the type of data and metadata that is representative of the full KNMI-LENTIS dataset. The published data is year 2000 from member _h010_. See Section 3. 

Further, all KNMI-LENTIS simulations are labeled per the CMIP6 convention of variant labelling.  A variant label is made from four components: the realization index _r_, the initialization index _i_, the physics index _p_ and the forcing index _f_. Further details on CMIP6 variant labelling be found in [The CMIP6 Participation Guidance for Modelers](https://pcmdi.llnl.gov/CMIP6/Guide/modelers.html). In the KNMI-LENTIS data set, the forcing is reflected in the first digit of the realization index _r_ of the variant label. For the historical simulations, the one thousands (r1000-r1999) have been reserved. For the SSP2-4.5 the five thousands (r5000-r5999) have been reserved. The parent is reflected in the second and third digit of the realization index _r_ of the variant label (r?01?-r?16?). The seed is reflected in the fourth digit of the realization index _r_: (r???0-r???9). The seed is also reflected in the initialization index _i_ of the variant label (i0-i9), so this is double information. The physics index _p5_ has been reserved for the ECE3p5 version: all KNMI-LENTIS simulations have the _p5_ label. The forcing index _f_ of the variant label is kept at 1 for all KNMI-LENTIS simulations. As an example, variant label r5119i9p5f1 refers to: the 2K time slice with parent 11 and randomizing seed number 9. The physics index is 5, meaning the run is done with the ECE3p5 version of EC-Earth3. 

## **3. All NetCDF files of 1 member h010 -- Available variables in KNMI-LENTIS**

The netcdf files in [Zenodo dataset]|() are the data of 1 year from 1 member _h010_ to give insight into the type of data and metadata that is representative of the full KNMI-LENTIS dataset, as mentioned above. Total number of files is 172.   

All variables are cmorised following CMIP6 data format convention. The available variables are listed in the file **request-overview-CMIP-historical-including-EC-EARTH-AOGCM-preferences.txt**  The text files gives an overview of variables available per output frequency. The output frequencies are: AERmon, Amon, Emon, LImon, Lmon, Ofx, Omon, SImon, fx, Eday, Oday, day, CFday, 3hr, 6hrPlev, 6hrPlevPt. Further details on the variables and their output dimensions is available via the [following search tool](https://clipc-services.ceda.ac.uk/dreq/mipVars.html). Section 4.1 elaborates on   

## **4. How and Where is the data deposited**

In the Zenodo folder, there are several text files and several netcdf files. The text files provide details on all available KNMI-LENTIS files, in particular **details for the tar zipped files in ECFS per scenario (hxxx and sxxx) and per output frequency.** The tar zipped files contain all 10 years (10 separate netcdf files) from the respective member.   

Data from KNMI-LENTIS is available to those who have access to the [ECMWF ECFS tape storage system](https://www.ecmwf.int/en/computing/our-facilities/data-handling-system). Else, data can be downloaded and made available by the authors upon request. The tar-zipped files that are listed in the various text files  in the folder `data_structure_on_ECFS` are located in ec:/nklm/LENTIS/ec-earth/cmorised_by_var/:

```bash
#!/bin/bash


#-------------------
# script to write out LENTIS details on ECFS
#-------------------


for freq in AERmon Amon Emon LImon Lmon Ofx Omon SImon fx Eday Oday day CFday 3hr 6hrPlev 6hrPlevPt; do
  for scen in hxxx sxxx; do
    els -l ec:/nklm/LENTIS/ec-earth/cmorised_by_var/${scen}/${freq}/* >> LENTIS_on_ECFS_${scen}_${freq}.txt
  done
done
```


Further, part of the data will be made publicly available from the [Earth System Grid Federation (ESGF) data portal.](https://esgf-node.llnl.gov/projects/cmip6/) We aim to upload most of the monthly variables for the full ensemble. As search terms use **EC-Earth** for model and **p5** for physical index to locate the KNMI-LENTIS data. 

## **5. Related links**

The production of the KNMI-LENTIS ensemble was funded by the KNMI (Royal Dutch Meteorological Institute) multi-year strategic research fund [KNMI MSO Climate Variability And Extremes (VAREX)](https://www.knmi.nl/research/weather-climate-models/projects/mso-climate-variability-and-extremes-varex)

Zenodo dataset corresponding to this GitHub repository:

Github repository for KNMI-LENTIS production code:
