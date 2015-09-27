# Introduction

1. Merging similar data using rbind() function.
2. Only those columns with the mean and standard deviation measures are taken from the whole dataset.
3. Take activity names and IDs from activity_labels.txt
4. On the whole dataset, those columns with vague column names are corrected.
5. Generate a new dataset with the average measures for each subject and activity type. Output file is "averages_data.txt".

#Variables

1. x_train, y_train, x_test, y_test, subject_train, subject_test contain the data from the files.
2. x_data, y_data and subject_data merge the previous datasets to further analysis.
3. features contains names for the x_data dataset.
4. A similar approach is taken with activity names through the activities variables.
5. all_data merges x_data, y_data and subject_data in a big dataset
6. averages_data contains the relevent averages which will be stored in a .txt file.
