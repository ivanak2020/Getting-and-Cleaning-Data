# 1. Fetch data about subjects and activities for each data set
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")

# 2. Fetch variable names
col_names <- c("index", "name")
features <- read.table("features.txt", col.names=col_names)
gsub("()","", features$name)
gsub("-","", features$name)

# 3. Fetch test data and add subject and activity columns
x_test <- read.table("./test/X_test.txt")
names(x_test) <- features$name;
x_test <- cbind(subject=subject_test, activity=y_test, x_test)
colnames(x_test)[1] <- "subject"
colnames(x_test)[2] <- "activity"

# 4. Fetch train data and add subject and activity columns
x_train <- read.table("./train/X_train.txt")
names(x_train) <- features$name;
x_train <- cbind(subject=subject_train, activity=y_train, x_train)
colnames(x_train)[1] <- "subject"
colnames(x_train)[2] <- "activity"

# 5. Build one data set
data_set <- rbind(x_test, x_train)

# 6. Fetch only necessary columns
col_names <- grep("mean|std",features$name, value=TRUE)
data_set_sub <- subset(data_set, select = c("subject", "activity", col_names))

# 7. Rename values in activity column
col_names_tmp <- c("value", "name")
activity_map <- read.table("activity_labels.txt", col.names=col_names_tmp)
data_set_sub <- transform(data_set_sub, activity = activity_map$name[match(activity, activity_map$value)])

# 8. Build data set with the average of each variable for each activity and each subject.
data_set_sum <- data_set_sub %>%
  group_by(subject,activity) %>%
  summarise(across(col_names,mean))
