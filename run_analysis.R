suppressMessages(library(plyr))
suppressMessages(library(dplyr))
suppressMessages(library(tidyr))

message("The script takes a few seconds to execute.  Please wait till you see the prompt ...")

#data_dir <- "C:\\Videos\\coursera\\Data Science\\workspace\\R\\GettingAndCleaningData\\UCI HAR Dataset\\"
data_dir <- ""

# Read variable names
file <- paste0(data_dir,"features.txt")
variables_df <- tbl_df(read.delim(file, sep = "", header=F, col.names = c("SerialNo", "Feature")))

# Read training data set - x data
file <- paste0(data_dir,"X_train.txt")
training_data <- tbl_df(read.delim(file, sep = "", header=F, col.names = variables_df$Feature))

# Read and add subjects data to training data set
file <- paste0(data_dir,"subject_train.txt")
subjects_df <- tbl_df(read.delim(file, sep = "", header=F, col.names = c("Subject")))
tdata <- mutate(training_data, Subject = subjects_df$Subject)

# Read and add activity data to training data set
file <- paste0(data_dir,"y_train.txt")
activity_df <- tbl_df(read.delim(file, sep = "", header=F, col.names = c("Activity")))
trdata <- mutate(tdata, Activity = as.factor(activity_df$Activity))

# Read test data set - x data
file <- paste0(data_dir,"X_test.txt")
test_data <- tbl_df(read.delim(file, sep = "", header=F, col.names = variables_df$Feature))

# Read and add subjects data to test data set
file <- paste0(data_dir,"subject_test.txt")
subjects_df <- tbl_df(read.delim(file, sep = "", header=F, col.names = c("Subject")))
ttdata <- mutate(test_data, Subject = subjects_df$Subject)

# Read and add activity/Y data to test data set
file <- paste0(data_dir,"y_test.txt")
activity_df <- tbl_df(read.delim(file, sep = "", header=F, col.names = c("Activity")))
ttdata <- mutate(ttdata, Activity = as.factor(activity_df$Activity))

# Combine the two data sets, merge not required as both data sets are unique
tdata <- rbind(trdata, ttdata)

# Extract only the measurements on the mean and standard deviation for each measurement
# Also add the activity and subject variables
colNames <- colnames(tdata)
tdata <- tdata[,grep("\\.mean\\.{2}|std|^subject$|^Activity$",colNames,ignore.case=T)]

# Read activity labels and rename the Activity column
file <- paste0(data_dir,"activity_labels.txt")
labels_df <- tbl_df(read.delim(file, sep = "", header=F, col.names = c("ActivityNumber", "Name")))
#levels(tdata$Activity) <- labels_df$Name
tdata$Activity <- mapvalues(tdata$Activity, labels_df$ActivityNumber, as.vector(labels_df$Name), warn_missing=F)

# Prepare column names for tidying the data set
c <- colnames(tdata)
c <- gsub("\\.{3}","-", c) # convert 3 successive dots seen just before theaxis name to '-'
c <- gsub("\\.{1,}$","", c) # remove the trailing dots
c[grep("Mag", c)] <- paste0(c[grep("Mag", c)],"-NA") # adjust tha magnitude variaables to include NA at the end as they are not axes-related
colnames(tdata) <- c

# Tidy the data 
# Reorganize the data according to feature, function and Axis
# Backup - tdata <- tdata1
tdata <- tdata %>%
        gather(Signal.FunctionAxis, Value, -Subject, -Activity) %>%
        separate(Signal.FunctionAxis, c("Signal", "Function", "Axis"), sep="\\.|-") %>%
        arrange(Subject, Activity, Signal, Function, Axis)

# Use meaningful names for values of Function
tdata$Function <- mapvalues(tdata$Function, c("mean", "std"), c("Mean Value", "Standard Deviation"), warn_missing=F)

# Summarize by variable, activity and subject; variable is a combination of signal, function and axis
detach(package:plyr)
summary <- tdata %>%
        group_by(Subject, Activity, Signal, Function, Axis) %>%
        summarize(Count = n(),
                  Average = mean(Value))

message("The data set is stored in a variable called 'summary'.  Type summary at the prompt to view the data set.")



