        if (!file.exists("data")) {
                dir.create("data")
        }
# Sample file to use ￼￼￼
# https://data.baltimorecity.gov/Transportation/Fixed-Speed-Cameras/aqgr-xx9h
# https://data.baltimorecity.gov/api/views/aqgr-xx9h/rows.csv?accessType=DOWNLOAD
# cvs
        fileUrl <- "https://data.baltimorecity.gov/api/views/aqgr-xx9h/rows.csv?accessType=DOWNLOAD"
        download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
        list.files("./data")

# date downloaded
        dateDownload <- date()
#------------------------------------------------------
# Download as .xlsx
        if (!file.exists("data")) {
                dir.create("data")
        }
        fileUrl <- "https://data.baltimorecity.gov/api/views/aqgr-xx9h/rows.xlsx?accessType=DOWNLOAD"
        download.file(fileUrl, destfile = "./data/cameras.xlsx", method = "curl")

# Reading xlsx. Install xlsx package. Need to run library as a habit
        library(xlsx)
        cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, header = TRUE)
        head(cameraData)
# Assigning colIndex to read a specific rows or columns
        colIndex  <- 2:3
        rowIndex <- 1:4

        cameraDataSubset <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1,
                                      colIndex = colIndex,
                                      rowIndex = rowIndex )
        cameraDataSubset
### Important . Sharing your data to Excel for other's data consumption
        write.xlsx(cameraDataSubset, "./data/cameraDataSubset.xlsx", sheetName = "CameraDataSubset")
#----------------------------------------
## XML
        install.packages("XML")
        library(XML)

        fileUrl <- "http://www.w3schools.com/xml/simple.xml"
        doc <- xmlTreeParse(fileUrl, useInternal = TRUE )
        rootNode <- xmlRoot(doc)
# will extract the first items(wrap)
        names(rootNode)
        rootNode[[1]]
        rootNode[[1]][[1]]

#Programmatically extract files
        xmlSApply(rootNode, xmlValue)
# Get items on the menu prices
        xpathSApply(rootNode, "//name", xmlValue)
        xpathSApply(rootNode, "//price", xmlValue)

# NFL example
#  sample - http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens
#  Go Bengals !!!
# ue html instead of XML parse
        fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
        doc <- htmlTreeParse(fileUrl, useInternal = TRUE)
# The example on the lecture use "li" but this may change depending on the updated
# website. currently the scores can be found using "div"
        scores <- xpathSApply(doc, "//div[@class='score']", xmlValue)
        teams <- xpathSApply(doc, "//div[@class = 'game-info']", xmlValue)

# Reading data from Jason
        library(jsonlite)
        jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
        names(jsonData)
        names(jsonData$owner)
        jsonData$owner$login
# Writing Data frames to JSON
        myjson <- toJSON(iris, pretty = TRUE)
        cat(myjson)
#Convert back to JSON
        iris2 <- fromJSON(myjson)
#Create data tables just like data frames
        install.packages("data.table")
        library(data.table)
#Example
        example("data.table")
        DF = data.frame(x=rnorm(9), y = rep(c("a","b","c"), each = 3), z = rnorm(9))
        DT = data.table(x= rnorm(9), y = rep(c("a","b","c"), each = 3), z = rnorm(9))
        tables()
        DT[2,]
        DT[DT$y == "a"]
        DT[c(2,3)]

        {
          x = 1
          y = 2
        }
        k = {print(10); 5}
        print(k)
# Calculating Values for variable with expression
#           after comma means that it pertain to column not row
        DT[,list(mean(x), sum(z))]

# Adding new column
        DT[, w:= z^2]
#Special variable
        set.seed(123)
        DT <- data.table(x = sample(letters[1:3], 1E5, TRUE))
        # will count by column x
        DT[, .N, by=x]

# Keys
        DT <-data.table(x= rep(c("a","b","c"), each=100), y = rnorm(300))
        setkey(DT, x)
        DT['a']
#Join. Will only show what is matched. otherwise it drop the unmatched values
        DT1 <- data.table(x= c("a","a","b","dt1"), y= 1:4)
        DT2 <- data.table(x= c("a","b","dt1"), z= 5:7)
        setkey(DT1,x); setkey(DT2,x)
        merge(DT1, DT2)

# Fast reading comparison between data.frame and data.table
        big_df <- data.frame(x = rnorm(1E6), y= rnorm(1E6))
        file <- tempfile()
        write.table(big_df, file=file, row.names = FALSE, col.names = TRUE,
                    sep= "\t", quote = FALSE)
        system.time(fread(file))

# if read table is used, its slower
        system.time(read.table(file, header = TRUE, sep= "\t"))

        library(data.table)
     *   DTmean <- mean(DT$pwgtp15, by=DT$SEX)
        DTTapply <- tapply(DT$pwgtp15, DT$SEX, mean)
     *   DTMean3 <- mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)
     *   DTrowMean <- rowMeans(DT)[DT$SEX==1];rowMeans(DT)[DT$SEX==2]
        DTSapply <- sapply(split(DT$pwgtp15,DT$SEX),mean)
       DTDT <- DT[,mean(pwgtp15), by=SEX]

      tidyquestion <- read.csv("getdata_data_ss06pid.csv")
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

       ngap <- read.xlsx("ngap.xlsx", sheetIndex = 1, header = TRUE)
       head(ngap)
       tail(ngap)

