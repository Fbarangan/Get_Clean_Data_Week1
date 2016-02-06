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
       names(rootNode)
