### Script: run_analysis.R 
**Author:** Nainesh Vashi  
**Usage Guidelines:**  
- The script tidies the data set obtained from wearable computing devices and summarizes it to produce a data frame 'Summary'.
- The script uses/reads the following files for data and information - *X_train.txt, y_train.txt, X_test.txt, y_test.txt, subjects_train.txt, subjects_test.txt, features.txt, activity_labels.txt*. 
- **For the script to run successfully, all the mentioned files should be in the working directory.**  
- To run the script execute the following at the prompt,  
	- *setwd(Path to Working Dir)*
	- *source(Path to run_Analysis.R)*
	- Type **_summary_** at the prompt to view the data.
- The data frame **_summary_** contains 11880 observations of 7 variables.  *__30__ subjects X __6__ activities X __66__ measurements (std and mean only) = __11880__ observations*

	
### Below are the steps followed (logic) in the script to achieve the required output -

1. Read variable names from the variables file features.txt into a data frame.
2. Read training data set - X_train.txt, mark column names as feature names from the variables dataframe.

3. Read the subjects file - subjects_train.txt, to a dataframe 
4. Add the subject/volunteer numbers data to training data set under the column name 'Subject' using mutate

5. Read the activity number file - y_train.txt
6. Add activity data to training data set under column name 'Activity' using mutate

7. Read training data set - X_test.txt, mark column names as feature names from the variables dataframe.

8. Read the subjects file - subjects_test.txt, to a dataframe 
9. Add the subject/volunteer numbers data to training data set under the column name 'Subject' using mutate

10. Read the activity number file - y_test.txt
11.  Add activity data to training data set under column name 'Activity' using mutate

12. Combine the two data sets using rbind, merge not required as both data sets are unique

13. Extract only the measurements on the mean() and the std()/standard deviation for each measurement.  I have used grep to identify the column names containing the names. 
14. Output is 68 columns/variables out of which 66 are measurements and the remaining two are Activity and Subject.

15. Read activity labels and transform the activity factor levels to the descriptive names.  I have used the convenient mapvalues function for that.

16. Prepare column names for tidying the data set
	- Convert 3 successive dots seen just before the axis name to '-'
	- Remove the trailing dots in each name
	- Adjust the magnitude variables to include NA at the end (as these are are not axes-related)

17.  Tidy the data - Reorganize the data according to feature, function and Axis.  I have used chaining for the steps below -
	- Use gather() to gather the data using all columns except the Subject and Activity columns.  I have used 'Signal.FunctionAxis' as the key and 'Value' as the value.
		- The 'Signal.FunctionAxis' column has values in the format *Signal.Function-AxisName* e.g. *tBodyAcc.mean-X, tGravityAcc.mean-Y, fBodyAccMag.std-NA, etc*.
	- Use separate() to separate the above column in to three columns viz. Signal, Function and Axis
	- Use arrange() to sort it in the order Subject, Activity, Signal, Function, Axis

18. Use meaningful names for values of Function: mean -> Mean value, std -> Standard Deviation
19. Summarize by variable, activity and subject; variable is a combination of signal, function and axis.

20. Use meaningful names for values of Function

21. Summarize by variable, activity and subject using the steps below; variable is a combination of signal, function and axis
	- Use group by on Subject, Activity, Signal, Function, Axis
	- Use summarize to get the Count = n() and the Average = mean(Value) columns. 
	- Get the output in a data frame called summary
	
