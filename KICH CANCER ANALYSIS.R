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
cancer.Type=cohorts[grep ("kidney", cohorts$description, ignore.case = T), 1]
print(cancer.Type)

KICH.Pats=FirebrowseR::Samples.Clinical(cohort=cancer.Type, format = "tsv")
dim(KICH.Pats)
##[1] 150. 111
all.Recieved=FALSE
page.Counter=1
page.size=150
KICH.Pats=list()
while(all.Recieved==FALSE){KICH.Pats[[page.Counter]]=Samples.Clinical(format = "csv", cohort = cancer.Type, page_size = page.size, page=page.Counter)}
if(page.counter>1) colnames(KICH.Pats[[page.Counter]])=colnames(KICH.Pats[[page.Counter-1]])
if(nrow(KICH.Pats[[page.Counter]])<page.sizes) {all.Recieved=TRUE} else{page.Counter=page.Counter-1}
KICH.Pats=do.call(rbind,brca.Pats)
dim(KICH.Pats)
KICH.Pats=KICH.Pats[ which(KICH.Pats$vital_status=="dead"),]
diff.Exp.Genes=c("TP53","CDC27","PABPC1","PTEN","AMAC1L3","ZNF814","MTMR9","RB1")
all.Found=FALSE
page.Counter=1
mRNA.Exp=list()
page.size=2000
while(all.Found==FALSE){mRNA.Exp[[page.Counter]]=FirebrowseR::Samples.mRNASeq(format="csv",gene=diff.Exp.Genes,cohort="KICH", tcga_participant_barcode = brca.Pats$tcga_participant_barcode,page_size = page.Size, page=page.Counter)}
if(nrow(mRNA.Exp[[page.Counter]]) < page.size) all.Found = TRUE else page.Counter = page.Counter + 1


##Error: object 'page.Size' not found
##how do I get page.Size
##change page.size to 2000 Error->Error in if (nrow(mRNA.Exp[[page.Counter]]) < page.size) all.Found = TRUE else page.Counter = page.Counter +  : argument is of length zero



mRNA.Exp = do.call(rbind,mRNA.Exp)
dim(mRNA.Exp)
normal.Tissue.Pats=which(mRNA.Exp$sample_type=="NT")
patient.Barcodes=mRNA.Exp$tcga_participant_barcode[normal.Tissue.Pats]   
mRNA.Exp=mRNA.Exp[which(mRNA.Exp$tcga_participant_barcode %in% patient.Barcodes & mRNA.Exp$sample_type %in% c ("NT", "TP")),]     
library(ggplot2)  


##tapered with these 2 lines to try and get a graph
p=ggplot(cohorts, aes(factor(weight), z.score))
p+ geom_boxplot(aes(fill=factor(sample_type))) + scale_y_continuous(limits=c(-1,5)) + scale_fill_discrete(name="Tissue")



##creating ggplot data frame 


ggplot2::cohorts
ggplot_add(KICH,KITCH.Pats,gene.analysis)
##
##data frame not showing in environment but having no error