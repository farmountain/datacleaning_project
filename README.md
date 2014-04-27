datacleaning_project
====================

datacleaning_project

1. Read files X_test,X_train.y_test,y_train,Subject_test,Subject_train,features and activity_lables text files into dataframes.
2. Column bind Dataframes y_test and subject_test
3. Column bind Dataframes y_train and subject_train
4. Merge 2 & 3
5. Merge X_train and X_test data
6. Subset only columns have "mean()" or "std()" in the column names
7. Column bind 2 sets of data
8. Take mean of observations per activity per subject
9. Replace activity numbers with Activity names from activity_lables.txt-> FinalMege
10. use write.table to get a text file from the above Data Frame - output finalmerge.txt
