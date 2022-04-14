if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Biobase")
install.packages("librarian")
librarian::shelf(devtools,moriodeng/FirebrowseR, ggplot2)

##trying to download FirebrowseR, error recieved said that there was no package named FirebrowseR
if(!require("FirebrowseR",quietly = TRUE))
   install.packages("FirebrowseR")
##after an attempted download the same error continued to pop up. upon further investigation it is saying that package FirebrowseR is not available for this version of R
##A version of this package for your version of R might be available elsewhere

cohorts=FirebrowseR::Metadata.Cohorts(format="csv")
