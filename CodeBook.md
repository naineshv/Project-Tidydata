## Codebook for Summary DataSet
The dataset intends to capture the summary of the experiments performed on volunteers(subjects) to measure the effectiveness of wearable devices. 

### Brief Introduction
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


### Dataset Details: 
- File name - summary.dataset.txt 
- It is a space(' ') separate separated values file.  The first line is the header containing the variable names.
- The file contains 11880 observations of 7 variables.  *__30__ subjects X __6__ activities X __66__ measurements (std and mean only) = __11880__ observations*
- The data set has 7 variables/columns as below -
	1. **Subject**:	Column showing the subject or volunteer number.
	2. **Activity**:	Column showing the activity name during which the measurements were taken.
	3. **Signal**:	Column showing the signal that was measured.
	4. **Function**:	Column showing the function/variable that was calculated using the signal measurements.
	5. **Axis**:		Column showing the axis name along which the signals were measured.
	6. **Count**:	Column showing the total number of measurements grouped by Subject, Activity, Signal, Function and Axis.
	7. **Average**:	Column showing the average value over the number of measurements shown in the Count column grouped by Subject, Activity, Signal, Function and Axis.
		

### Variable Details:
1. **Subject**: The variable shows the subject number or the volunteer number on whom the experiment was performed.  The range of the value is 1 to 30.  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

2. **Activity**: This variable records the activity during which the measurements were taken.  Each volunteer performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  The values in this column will be one of these only.

3. **Signal**:  This variable records the name of the sensor signals obtained from the wearable device on the Subject when performing an activity.  Using the embedded accelerometer and gyroscope of the wearable device, 3-axial linear acceleration and 3-axial angular velocity were captured. The variable can have one of the following 17 values only:  
*[1] "fBodyAcc"             "fBodyAccJerk"         "fBodyAccMag"          "fBodyBodyAccJerkMag"  
[5] "fBodyBodyGyroJerkMag" "fBodyBodyGyroMag"     "fBodyGyro"            "tBodyAcc"  
[9] "tBodyAccJerk"         "tBodyAccJerkMag"      "tBodyAccMag"          "tBodyGyro"  
[13] "tBodyGyroJerk"        "tBodyGyroJerkMag"     "tBodyGyroMag"         "tGravityAcc"  
[17] "tGravityAccMag"*  
The variables are to be read as follows:
	- *The first letter*: This is either 't' or 'f'.  
		- *t* - Time domain signals.  
		- *f* - Fast Fourier Transform (FFT) of these signals.
	- *The second part*: This can be either  'Body' or 'Gravity'.  
		- *Body* - Body Acceleration signals.
		- *Gravity* - Gravity Acceleration signals.
	- *The third part*: This can be either 'Acc' or 'Gyro'
		- *Acc* - This signal is from Accelerometer embedded in the wearable device.
		- *Gyro* - This signal is from Gyroscope embedded in the wearable device.
	- *The fourth part*: This can be either 'Jerk', 'Mag' or 'JerkMag' or may not be present for some measurements.
		- *Jerk* - Jerk Signals obtained from deriving the body linear acceleration and angular velocity in time.
		- *Mag* - Magnitude of these three-dimensional signals calculated using the Euclidean norm.
		- *JerkMag* - Magnitude of jerk signals calculated using the Euclidean norm.
	- *Examples*:
		- *fBodyAcc* - read as Fast Fourier Transform of Body acceleration signal obtained from Accelerometer
		- *tBodyGyroMag* - read as Magnitude (calculated using the Euclidean norm) of time domain signal of Body acceleration signal obtained from Gyroscope.

4. **Function**: The functions estimated using these signals -
	- Mean value - mean()
	- Standard deviation - std()
	
5. **Axis**: The axis representing the value of the 3-axial signal measurement.  It can be X, Y or Z.  A value of NA indicates that the measurement is not axial and hence it is not assigned to any axis.

6. **Count**: The number of signal measurments taken for the subject when performing a particular activity per function per axis(where applicable).

7. **Average**: Average value over the number of measurements shown in the Count column grouped by Subject, Activity, Signal, Function and Axis.

