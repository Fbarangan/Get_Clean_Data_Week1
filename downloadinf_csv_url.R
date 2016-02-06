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
