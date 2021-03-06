# Matthew Pillmeier
# Temporary R Working File

# ----- Version -----
R.version
getRversion()
cat("\014")   # Same as 'Ctrl-L', clears Console

# ----- Library -----
# Default library specified in Windows Environment variable R_LIBS_USER
.libPaths()
#.libPaths("C://R/Libraries/RRO_3.1.2")   # Default, specified in R_LIBS_USER
#.libPaths("C://R/Libraries//R_2.15.3")   # Replaces default
.Library
.Library.site

# ----- Rprofile -----
# Location: etc/Rprofile.site
# Removed the RRO default repository (located in etc\Rprofile.site) because it utilizes a specific snapshot 
# date and therefore prevents updates to the latest version
getOption('repos')

# ----- Packages -----
# Github Development Packages
# For some reason, the downloads from github produce the following SSL Certificate error. To ignore
# this warning, setup `httr` to pass to `RCurl` a flag to ignore verification.
#   Error in function (type, msg, asError = TRUE)  : 
#   SSL certificate problem, verify that the CA cert is OK. Details:
#   error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed
library(RCurl)
library(httr)
set_config( config( ssl.verifypeer = 0L ) )   # Ignores the SSL check
# For projects pulled down, insert 'sslVerify = false' into 'gitconfig' file
#https://github.com/hadley/devtools
library(devtools)

# Data.Table
# https://github.com/Rdatatable/data.table/
#install_github("Rdatatable/data.table", build_vignettes=FALSE)
library(data.table)
#ls("package:data.table")
#lsf.str("package:data.table")
#methods(class="data.table")

# Time
# http://www.rforge.net/fasttime/files/
#install.packages("C:/R/Downloaded/fasttime_1.0-0.tar.gz", repos = NULL, type = "source")
library(fasttime)   # fastPOSIXct assumes an input format of "%Y/%m/%d %H:%M/%S", no way to change it
devtools::install_github("hadley/RcppDateTime")

# Data Manipulation
#library(reshape)
library(reshape2)

# Graphics
library(ggplot2)
library(gridExtra)
# R Shiny (https://github.com/rstudio/shiny)
devtools::install_github("rstudio/htmltools")
devtools::install_github("rstudio/shiny")
#library(shiny)
# R ggvis (https://github.com/rstudio/ggvis)
devtools::install_github("rstudio/ggvis", build_vignettes = FALSE)
#library(ggvis)
# R Charts
devtools::install_github("ramnathv/rCharts")
library(rCharts)
library(googleVis)
# Plotly
devtools::install_github("ropensci/plotly")
# Waffle Plots
devtools::install_github("hrbrmstr/waffle")

# Documents
#install.packages(c("shiny", "shinyFiles", "rmarkdown"))
devtools::install_github("rstudio/shinybootstrap2")
devtools::install_github("trestletech/shinyAce")
devtools::install_github("ebailey78/shinyBS")
devtools::install_github("swarm-lab/editR")
library(editR)

# String Manipulation
#install_github('Rexamine/stringi')
library(stringi)  # Currently using CRAN version
#library(stringr)

# Excel
library(XLConnect)
library(xlsx)
devtools::install_github("hadley/readxl")
library(readxl)

# Misc File Reads
devtools::install_github("hadley/readr")

# DB
library(RODBC)
library(RODBCext)
library(RSQLite)
library(RSQLite.extfuns)
.SQL92Keywords   # SQL Keywords
library(RMySQL)

# XML
library(xml2)

# Operation Piping
# R magrittr (https://github.com/smbache/magrittr)
#install_github("smbache/magrittr")
library(magrittr)

# Lambda
library(lambda.r)

# Parallel Computing
library(snow)
# Revobase was previously installed by default, now apparently left as a zip in the /etc directory
install.packages("C:/R/RRO-3.1.2/etc/Revobase_7.3.0.zip")
library(Revobase) # Intel MKL thread control available in RRO only
getMKLthreads()
#setMKLthreads(2)
# Parallel Tools
#install.packages("C:/R Projects/Downloaded/partools_1.0.1.tar.gz", repos = NULL, type = "source")
library(partools)

# Dplyr (https://github.com/hadley/dplyr)
#devtools::install_github("hadley/lazyeval")
#devtools::install_github("hadley/dplyr", build_vignettes=F)
library(dplyr)

# R Pivot Table
devtools::install_github("ramnathv/htmlwidgets")
devtools::install_github("smartinsightsfromdata/rpivotTable")

# Rmetrics
#source("http://www.rmetrics.org/Rmetrics.R")
#install.Rmetrics()

# Rcpp
# http://www.rcpp.org/
#library(Rcpp)

# Rcpp11
# https://github.com/Rcpp11/Rcpp11
devtools::install_github("Rcpp11/Rcpp11")
devtools::install_github("Rcpp11/attributes") # Failed first few times, reloaded devtools, then works, why?
#library(Rcpp11)
#library(attributes)

# R6 (OO System)
library(R6)

# Timing
library(microbenchmark)

# GenomicRanges
# Run R As Administrator ...
#source("http://bioconductor.org/biocLite.R")
#biocLite("GenomicRanges")
library(GenomicRanges)

# SVG
#install_github("duncantl/SVGAnnotation")
#library(SVGAnnotation)

# Rmetrics
#source("http://www.rmetrics.org/Rmetrics.R")
#install.Rmetrics()

# ----- Settings -----
search()
devtools::session_info()

# Timezone
Sys.timezone()
Sys.setenv(TZ='GMT')
#Sys.setenv(TZ="America/New_York")

# Options
options(max.print=100)
options(data.table.nomatch=0)
options(stringsAsFactors=F)
getOption("na.action")
getOption("data.table.nomatch")

# Snow Cluster
# `parLapply` did not show obvious gains
#num.cores <- 4
#cluster <- makeSOCKcluster(rep("localhost",num.cores))
#clusterEvalQ(cluster, library(data.table))
#clusterEvalQ(cluster, library(magrittr))
#clusterEvalQ(cluster, library(stringi))
#stopCluster(cluster)



#search()
#detach("package:dplyr")
#library(googleVis)
#library(ggVis)
build_github_devtools()

# Example code
a.dt <- data.table(a=rep(LETTERS[1:10],10), b=rnorm(100,0,1), c=1:100)
setkey(a.dt, a)
b.dt <- a.dt[, list(mean(b), sd(b)), by=a]

p1 <- ggplot(b.dt, aes(x=a, y=V1))
p1 <- p1 + geom_bar(stat='identity',fill='red')
p1

p2 <- ggplot(a.dt, aes(x=c, y=b))
p2 <- p2 + geom_line()
p2 <- p2 + geom_point()
p2 <- p2 + geom_smooth(se=F)
p2

p3 <- ggplot(a.dt, aes(x=b))
p3 <- p3 + geom_density()
p3 <- p3 + facet_wrap(~ a)
p3

p.sub.1 <- arrangeGrob(p1, p2, nrow=1)
p.all <- arrangeGrob(p.sub.1, p3, nrow=2)
print(p.all)

setkey(All.Hrly.dt, Year, Month, PKPRD_2)
res.1 <- microbenchmark(t.1 <- All.Hrly.dt[,mean(`LMP.DA.NY-K`, na.rm = T), by=list(Year, Month, PKPRD_2)], times=1000L)
res.2 <- microbenchmark(t.2 <- All.Hrly.dt %>% 
          select(`LMP.DA.NY-K`, Year, Month, PKPRD_2) %>%
          group_by(Year, Month, PKPRD_2) %>%
          summarize(V1=mean(`LMP.DA.NY-K`, na.rm=T)),
          times=1000L)

plt <- ggplot2::qplot(y=time, data=res.1, colour=expr)
plt <- plt + ggplot2::scale_y_log10()
print(plt)

x <- 10
my.f <- function() {
  i <- x
  t.f <- function() {
    i <<- i + 1
    i
  }
}

s.f <-my.f()
x <- 20
s.f()
x

install.packages('RMySQL',type='source')
readRegistry("SOFTWARE\\MySQL AB", hive="HLM", maxdepth=2)

library(RODBC)
ch <- odbcConnect("sakila", "A00113700", "Password1")
sqlTables(ch)

library(dplyr)
my_db <- src_mysql("sakila", user="A00113700", password="Password1")
my_tbl <- tbl(my_db, "actor")

library(RMySQL)
library(data.table)
library(magrittr)
my_db <- dbConnect(MySQL(), username='A00113700', password='Password1', dbname='test')
dbListTables(my_db)
t.1.dt <- data.table(a=1:10, b=LETTERS[1:10], c=ISOdate(2014, 10, 11:20, 0, tz='GMT'))
str(t.1.dt)
dbWriteTable(my_db, 't_1', t.1.dt)
t.2.dt <- data.table(a=round(runif(1e6)*100,0), 
                     b=LETTERS[sample(1:26, 1e6, T)], 
                     c=ISOdate(2014, sample(1:12, 1e6, T), sample(1:28, 1e6, T), 0, tz='GMT'))
setkey(t.2.dt, c)
t.2.dt[,d:=strftime(c, "%Y-%m-%d"), by=c]
t.2.dt[,c:=NULL]
str(t.2.dt)
dbWriteTable(my_db, 't_2', t.2.dt, row.names=FALSE)

res <- dbSendQuery(my_db, 'select count(*) from t_2')
t.3.df <- fetch(res, n=-1)
dbClearResult(res)

res <- dbSendQuery(my_db, "select * from t_2")
res <- dbSendQuery(my_db, "select distinct(d) As Date, count(a) As Cnt, avg(a) As Mean from t_2 group by d order by d")
t.4.dt <- fetch(res,n=-1)
setDT(t.4.dt)
t.4.dt
dbClearResult(res)

dbDisconnect(my_db)

rm(list=ls())
gc()


# Aligne Price Formulas
setwd("X:/Zainet/odbs")
getwd()

pcurve.dt <- fread("MRP_PCURVE.rpt", sep="|")
pcurve.dt[,V9:=NULL]
pcurve.dt %>% str

pricedtl.dt <- fread("MRP_PRICEDTL.rpt", sep="|")
pricedtl.dt[,V5:=NULL]
pricedtl.dt %>% str

file.name <- "MRP_PFORMULA.rpt"
pformula.char.1 <- readChar(file.name, file.info(file.name)$size)
pformula.char.2 <- stri_replace_all_fixed(pformula.char.1, pattern="\r\n", replacement="")
pformula.char.3 <- stri_replace_all_regex(pformula.char.2, "([^|]*\\|[^|]*\\|[^|]*\\|[^|]*\\|[^|]*\\|[^|]*\\|)", "$1\r\n")
pformula.dt <- fread(pformula.char.3, sep="|",colClasses=list(character=2:5, integer=c(1,6)))
pformula.dt[, V7:=NULL]
pformula.dt %>% str


# Join the tables
pcurve.dt %>% setkey(PCURVE_IDX)
pricedtl.dt %>% setkey(PRICEDTL_PPOINT)
prc.crv.dt <- pricedtl.dt[pcurve.dt]

prc.crv.dt %>% setkey(PRICEDTL_FORMULA)
pformula.dt %>% setkey(PFORMULA_IDX)
prc.all.dt <- pformula.dt[prc.crv.dt]
prc.all.dt %>% str

t <- lapply(c("pcurve.dt", "pricedtl.dt", "pformula.dt", "prc.all.dt"), l(x ~ x %>% get %T>% (nrow %,% print)))

prc.all.dt %>% setkey("PCURVE_PSET", "PCURVE_MKT", "PCURVE_COMP")
prc.all.dt[J("MARKET", "PJMDAY", "MANIT2"), list(PFORMULA_NAME, PFORMULA_DSC, PFORMULA_TEXT)]
prc.all.dt[J("MARKET", "PJMDAY", "OCCOQ2"), list(PFORMULA_NAME, PFORMULA_DSC, PFORMULA_TEXT)]
prc.all.dt[J("MARKET", "PJMDAY", "BRNSWK"), list(PFORMULA_NAME, PFORMULA_DSC, PFORMULA_TEXT)]
prc.all.dt[J("MARKET", "PJMDAY", "DOMZON"), list(PFORMULA_NAME, PFORMULA_DSC, PFORMULA_TEXT)]
prc.all.dt[J("ONPK", "NEPOOL", "STOWE"), list(PFORMULA_NAME, PFORMULA_DSC, PFORMULA_TEXT)]

prc.mkts.dt <- prc.all.dt[,list(GRP=.GRP), keyby=list(PCURVE_MKT, PCURVE_COMP, PCURVE_PSET)]
prc.mkts.dt[,GRP:=NULL]
prc.mkts.dt[J("POLR", "PPLR10")]


wordcensus <- function(basename,ndigs) {
  # find the file chunk to be handled by this worker
  fname <- filechunkname(basename,ndigs)
  words <- scan(fname,what="")
  # determine which words occur how frequently in this chunk
  tapply(words,words,length, simplify=FALSE)
}

fullwordcount <- function(cls,basename,ndigs) {
  setclsinfo(cls) # give workers ID numbers, etc.
  clusterEvalQ(cls,library(partools))
  # have each worker execute wordcensus()
  counts <- clusterCall(cls,wordcensus,basename,ndigs)
  # coalesce the output for the overall counts
  addlistssum <- function(lst1,lst2) addlists(lst1,lst2,sum)
  Reduce(addlistssum,counts)
}

test <- function() {
  cls <- makeCluster(2)
  # make a test file, 2 chunks
  cat("How much wood","Could a woodchuck chuck",file="test.1",sep="\n")
  cat("If a woodchuck could chuck wood?",file="test.2")
  # set up cluster
  cls <- makeCluster(2)
  # find the counts
  fullwordcount(cls,"test",1)
}



library(plotly)
# Fill in with your personal username and API key
# or, use this public demo account
py <- plotly(username='R-Demo-Account', key='yu680v5eii')

trace1 <- list(
  x = c(1, 2, 3), 
  y = c(4, 3, 2), 
  type = "scatter"
)
trace2 <- list(
  x = c(20, 30, 40), 
  y = c(30, 40, 50), 
  xaxis = "x2", 
  yaxis = "y2", 
  type = "scatter"
)
data <- list(trace1, trace2)
layout <- list(
  yaxis2 = list(
    domain = c(0.6, 0.95), 
    anchor = "x2"
  ), 
  xaxis2 = list(
    domain = c(0.6, 0.95), 
    anchor = "y2"
  )
)
response <- py$plotly(data, kwargs=list(layout=layout, filename="simple-inset", fileopt="overwrite"))
url <- response$url


library(R6)

env.tree.f <- function(x) {
  par.env <- parent.env(x)
  print(attr(par.env, "name"))
  
  if(!identical(par.env, emptyenv())) {
    env.tree.f(par.env)
  }
}