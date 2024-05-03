* download a data set from https://www.kaggle.com/datasets I used career prediction
* put in an s3 bucket
* glue data brew create a project
* select that datasets
* permission create a new role
* some minutes are necessary
* show the grid view but also the schema view
* on the profile we run a job to see the statistics information, correlations between variables, 
* back on grid, select the last column and I can see the column statistics
* if we have composed colum, we can select the 3 dots and split, a single delimiter,
* in my case I choose a space, control the preview and apply
* after I can rename the columns
* select a field like verbal reason and do the binaryzing in the new colum we have 0 if it is below the threashold or 1 if it is above
* after I did everything I create a Job (button on the top right), select a new folder
* on the right there are all the recipies that will be applied
* check on the jobs when it is finished we have in the s3 bucket the data transformed