run_analysis<-function() {
        
        ## assume that all data files are in the working directory
        ## requires libraries data.table, dplyr, plyr
        ## this function reads in the data, applies column names, removes unwanted
        ## columns, and summarizes based on subject and test
        ## output is a 180x81 data table of the averaged data for each
        ## subject / test pair
        ## see Readme.txt in this repo for more details


        
        ## read in the raw data to two data tables
        datatest<-read.table("x_test.txt",header=F,stringsAsFactors=F)
        datatrain<-read.table("x_train.txt",header=F,stringsAsFactors=F)
        ## and combine them into one big table
        data<-rbind(datatest,datatrain)
        
        ##now read in the feature names and apply them to the columns as headers

        features<-fread("features.txt",sep=" ",header=F,stringsAsFactors=F)
        feat_names<-features[[2]]
        
        ## add all the column names to the data table
        colnames(data)<-feat_names
        
        
        ## create a true false vector out of feature names based on criteria
        ## looks like meanFreq() is still in there - do you want that?
        stdcol<-grepl("std()", feat_names, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)
        meancol<-grepl("mean()", feat_names, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)
        savecol<-stdcol | meancol
        
        ## rm unwanted columns from data table fofo<-bobo[,savecol]
        data<-data[,savecol]
        
        ## add the subject_test and tests columns to data
        ytest<-fread("y_test.txt")
        ytrain<-fread("y_train.txt")
        tests<-rbind(ytest,ytrain)
        
        ## read in the subject names 
        subject_test<-read.table("subject_test.txt",header=F,stringsAsFactors=F)
        subject_train<-read.table("subject_train.txt",header=F,stringsAsFactors=F)
        subjects<-rbind(subject_test,subject_train)
        
        ## add columns to the data table for the subject and test
        data$subject<-subjects$V1
        data$test<-tests$V1
        
        ## summarize by subject, test, and get the mean
        tidy<-ddply(data, .(subject,test), colwise(mean))
        
        ## clean up the test names by applying the character strings
        activities<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
        
        for (i in 1:6) {tidy$test[tidy$test==i]<-activities[i]}
        
        ##and return the data
        tidy

     
        
}