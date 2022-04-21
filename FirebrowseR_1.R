if(!require("BiocManager",quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("Biobase")
install.packages("librarian")
librarian::shelf(devtools, mariodeng/FirebrowsreR,ggplot2)
devtools::install_github("mariodeng/FirebrowseR")
force=TRUE

##forces the repo to download

library(FirebrowseR)
library(ggplot2)
##loads the FirebrowseR library and the ggplot2 library
##For line of code below-API responded with code 404. Your query might be to big

cohorts=FirebrowseR::Metadata.Cohort(format = "csv")
##Needed spaces line 17 worked line 15 did not
cohorts = FirebrowseR::Metadata.Cohorts(format = "csv")
cancer.Type=cohorts[grep ("breast", cohorts$description, ignore.case = T), 1]
print(cancer.Type)
##[1] "BRCA"
brca.Pats=FirebrowseR::Samples.Clinical(cohort=cancer.Type, format = "tsv")
dim(brca.Pats)
##[1] 150. 111
all.Recieved=FALSE
page.Counter=1
page.size=150
brca.Pats=list()
while(all.Recieved==FALSE){brca.Pats[[page.Counter]]=Samples.Clinical(format = "csv", cohort = cancer.Type, page_size = page.size, page=page.Counter)}
if(page.counter>1) colnames(brca.Pats[[page.Counter]])=colnames(brac.Pats[[page.Counter-1]])
if(nrow(brac.Pats[[page.Counter]])page.sizes) {all.Recieved=TRUE} else{page.Counter=page.Counter-1}



