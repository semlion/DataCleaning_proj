Code book for Coursera Getting and Cleaning Data course project
================================================================
The data set that this code book pertains to is located in the tidy_data.txt file of this repository.
The tidy_data.txt data file is a text file, containing space-separated values.

Each row contains, for a given subject and activity, 79 averaged signal measurements:

1) subject

      Subject identifier, integer, ranges from 1 to 30.

2) activity

    Activity identifier, string with 6 possible values:
        WALKING: subject was walking
        WALKING_UPSTAIRS: subject was walking upstairs
        WALKING_DOWNSTAIRS: subject was walking downstairs
        SITTING: subject was sitting
        STANDING: subject was standing
        LAYING: subject was laying

3) Average of measurements

All measurements are floating-point values, normalised and bounded within [-1,1].

      timeDomainBodyAccelerometerMeanX
      timeDomainBodyAccelerometerMeanY
      timeDomainBodyAccelerometerMeanZ
      timeDomainBodyAccelerometerStandardDeviationX
      timeDomainBodyAccelerometerStandardDeviationY
      timeDomainBodyAccelerometerStandardDeviationZ
      timeDomainGravityAccelerometerMeanX
      timeDomainGravityAccelerometerMeanY
      timeDomainGravityAccelerometerMeanZ
      timeDomainGravityAccelerometerStandardDeviationX
      timeDomainGravityAccelerometerStandardDeviationY
      timeDomainGravityAccelerometerStandardDeviationZ
      timeDomainBodyAccelerometerJerkMeanX
      timeDomainBodyAccelerometerJerkMeanY
      timeDomainBodyAccelerometerJerkMeanZ
      timeDomainBodyAccelerometerJerkStandardDeviationX
      timeDomainBodyAccelerometerJerkStandardDeviationY
      timeDomainBodyAccelerometerJerkStandardDeviationZ
      timeDomainBodyGyroscopeMeanX
      timeDomainBodyGyroscopeMeanY
      timeDomainBodyGyroscopeMeanZ
      timeDomainBodyGyroscopeStandardDeviationX
      timeDomainBodyGyroscopeStandardDeviationY
      timeDomainBodyGyroscopeStandardDeviationZ
      timeDomainBodyGyroscopeJerkMeanX
      timeDomainBodyGyroscopeJerkMeanY
      timeDomainBodyGyroscopeJerkMeanZ
      timeDomainBodyGyroscopeJerkStandardDeviationX
      timeDomainBodyGyroscopeJerkStandardDeviationY
      timeDomainBodyGyroscopeJerkStandardDeviationZ
      timeDomainBodyAccelerometerMagnitudeMean
      timeDomainBodyAccelerometerMagnitudeStandardDeviation
      timeDomainGravityAccelerometerMagnitudeMean
      timeDomainGravityAccelerometerMagnitudeStandardDeviation
      timeDomainBodyAccelerometerJerkMagnitudeMean
      timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation
      timeDomainBodyGyroscopeMagnitudeMean
      timeDomainBodyGyroscopeMagnitudeStandardDeviation
      timeDomainBodyGyroscopeJerkMagnitudeMean
      timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation
      frequencyDomainBodyAccelerometerMeanX
      frequencyDomainBodyAccelerometerMeanY
      frequencyDomainBodyAccelerometerMeanZ
      frequencyDomainBodyAccelerometerStandardDeviationX
      frequencyDomainBodyAccelerometerStandardDeviationY
      frequencyDomainBodyAccelerometerStandardDeviationZ
      frequencyDomainBodyAccelerometerMeanFrequencyX
      frequencyDomainBodyAccelerometerMeanFrequencyY
      frequencyDomainBodyAccelerometerMeanFrequencyZ
      frequencyDomainBodyAccelerometerJerkMeanX
      frequencyDomainBodyAccelerometerJerkMeanY
      frequencyDomainBodyAccelerometerJerkMeanZ
      frequencyDomainBodyAccelerometerJerkStandardDeviationX
      frequencyDomainBodyAccelerometerJerkStandardDeviationY
      frequencyDomainBodyAccelerometerJerkStandardDeviationZ
      frequencyDomainBodyAccelerometerJerkMeanFrequencyX
      frequencyDomainBodyAccelerometerJerkMeanFrequencyY
      frequencyDomainBodyAccelerometerJerkMeanFrequencyZ
      frequencyDomainBodyGyroscopeMeanX
      frequencyDomainBodyGyroscopeMeanY
      frequencyDomainBodyGyroscopeMeanZ
      frequencyDomainBodyGyroscopeStandardDeviationX
      frequencyDomainBodyGyroscopeStandardDeviationY
      frequencyDomainBodyGyroscopeStandardDeviationZ
      frequencyDomainBodyGyroscopeMeanFrequencyX
      frequencyDomainBodyGyroscopeMeanFrequencyY
      frequencyDomainBodyGyroscopeMeanFrequencyZ
      frequencyDomainBodyAccelerometerMagnitudeMean
      frequencyDomainBodyAccelerometerMagnitudeStandardDeviation
      frequencyDomainBodyAccelerometerMagnitudeMeanFrequency
      frequencyDomainBodyAccelerometerJerkMagnitudeMean
      frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
      frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency
      frequencyDomainBodyGyroscopeMagnitudeMean
      frequencyDomainBodyGyroscopeMagnitudeStandardDeviation
      frequencyDomainBodyGyroscopeMagnitudeMeanFrequency
      frequencyDomainBodyGyroscopeJerkMagnitudeMean
      frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation
      frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency

Transformations

The zip file containing the source data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The following transformations were applied to the source data:

    -The training and test sets were merged to create one data set.
    -The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names (see Identifiers section).
    -Variable names were replaced with descriptive variable names
    -The measurements on the mean and standard deviation were extracted for each measurement, and the others were discarded