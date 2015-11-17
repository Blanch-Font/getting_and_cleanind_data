# Code Book

The database of this project contains 7 fields:
* id: subject identification 
* activity: type of activity: 
  + WALKING
  + WALKING_UPSTAIRS
  + WALKING_DOWNSTAIRS
  + SITTING
  + STANDING
  + LAYING
* feature: feature measured:
  + BodyAcc: accelerometer signal
  + BodyAccJerk: BodyAcc using Jerk signals
  + BodyAccJerkMag: BodyAccJerk using Euclidean norm
  + BodyAccMag: BodyAcc using Euclidean norm
  + BodyBodyAccJerkMag:  using Jerk signals
  + BodyBodyGyroJerkMag: BodyBodyAccJerkMag using Jerk signals
  + BodyBodyGyroMag: BodyBodyAccJerkMag using Euclidean norm
  + BodyGyro: gyroscope 3-axial signal
  + BodyGyroJerk: BodyGyro using Jerk singals
  + BodyGyroJerkMag: BodyGyroJerk using Euclidean norm
  + BodyGyroMag: BodyGyro using Euclidean norm
  + GravityAcc: acceleration signal for gravity acceleration signals
  + GravityAccMag: GravityAcc using Euclidean norm
* domain: domain type
  + t: time 
  + f: frequency
* axis: 3-axial signals in the X, Y and Z directions
* mean: mean for subject, activity, feature, domain and axis
* std: standard deviation for subject, activity, feature, domain and axis
