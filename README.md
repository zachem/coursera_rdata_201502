# coursera_rdata_201502
repo for coursera_rdata_201502 project

## Get data ##
Download 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unzip.

## Install "dplyr" ##
if needed
```
Rscript -e 'install.packages("dplyr",repos=c("http://cran.us.r-project.org"))' 
```

## Run script ##
Go to the unzipped dir.
Run as following
```
Rscript ../run_analysis.R
```

## Dict ##
subject -- individual's label 
label -- kind of activity:
 1 WALKING
 2 WALKING_UPSTAIRS
 3 WALKING_DOWNSTAIRS
 4 SITTING
 5 STANDING
 6 LAYING

measurements:
