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
  + BodyAcc: acceleration signal for body acceleration signals
  + BodyAccJerk: BodyAcc in time to obtain Jerk signals
  + BodyAccJerkMag: BodyAccJerk using Euclidean norm
  + BodyAccMag: BodyAcc using Euclidean norm
  + BodyBodyAccJerkMag: body linear acceleration
  + BodyBodyGyroJerkMag: body linear acceleration
  + BodyBodyGyroMag: body linear acceleration
  + BodyGyro
  + BodyGyroJerk
  + BodyGyroJerkMag
  + BodyGyroMag
  + GravityAcc: acceleration signal for gravity acceleration signals
  + GravityAccMag: GravityAcc using Euclidean norm
* domain: domain type
  + t: time 
  + f: frequency
* axis: 3-axial signals in the X, Y and Z directions
* mean: mean for subject, activity, feature, domain and axis
* std: standard deviation for subject, activity, feature, domain and axis
