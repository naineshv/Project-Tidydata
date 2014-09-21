## Script name: run_analysis.R 
### Author: Nainesh Vashi
### Usage:
	The script tidies the data set obtained from wearable computing devices and summarizes it to produce a data frame 'Summary'.  It also prints the data frame  to the screen.
	The script uses/reads the following files for data and information - X_train.txt, y_train.txt, X_test.txt, y_test.txt, subjects_train.txt, subjects_test.txt, features.txt, activity_labels.txt
	For the script to run, all the above files should be in the working directory.  To run the script,
		setwd(<Working Dir>)
		source(<path to run_Analysis.R>)
		
## Below are the steps followed to achieve the required output of the project.

## Read variable names from the variables file features.txt into a data frame.

## Read training data set - X_train.txt, mark column names as feature names from the variables dataframe.

## Read the subjects file - subjects_train.txt, to a dataframe 
## Add the subject/volunteer numbers data to training data set under the column name 'Subject' using mutate

## Read the activity number file - y_train.txt
## Add activity data to training data set under column name 'Activity' using mutate

## Read training data set - X_test.txt, mark column names as feature names from the variables dataframe.

## Read the subjects file - subjects_test.txt, to a dataframe 
## Add the subject/volunteer numbers data to training data set under the column name 'Subject' using mutate

## Read the activity number file - y_test.txt
## Add activity data to training data set under column name 'Activity' using mutate

## Combine the two data sets using rbind, merge not required as both data sets are unique

## Extract only the measurements on the mean() and the std()/standard deviation for each measurement.  I have used grep to identify the column names containing the names. 
## Output is 68 columns/variables out of which 66 are measurements and the remaining two are Activity and Subject.

## Read activity labels and transform the activity factor levels to the descriptive names.  I have used the convenient mapvalues function for that.

## Prepare column names for tidying the data set
	### Convert 3 successive dots seen just before the axis name to '-'
	### Remove the trailing dots in each name
	### Adjust tha magnitude variables to include NA at the end (as these are are not axes-related)

## Tidy the data 
## Reorganize the data according to feature, function and Axis.  I have used chaining here
	### Use gather() to gather the data using all columns except the Subject and Activity columns.  I have used 'Signal.FunctionAxis' as the key and 'Value' as the value.
		### The 'Signal.FunctionAxis' column has values in the format Signal.Function-AxisName e.g. tBodyAcc.mean-X, tGravityAcc.mean-Y, fBodyAccMag.std-NA, etc.
	### Use separate() to separate the above column in to three columns viz. Signal, Function and Axis
	### Use arrange to sort it in the order Subject, Activity, Signal, Function, Axis

### Use meaningful names for values of Function: mean -> Mean value, std -> Standard Deviation
### Summarize by variable, activity and subject; variable is a combination of signal, function and axis.

### Use meaningful names for values of Function

### Summarize by variable, activity and subject; variable is a combination of signal, function and axis
	### Use group by on Subject, Activity, Signal, Function, Axis
	### Use summarize to get the Count = n() and the Average = mean(Value) columns. 
	### Get the output in a data frame called summary
	### The script also prints the output
	
