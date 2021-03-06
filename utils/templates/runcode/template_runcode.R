########Input R parameters generated by experGen suite of tools for use in driver script -------
rm(list=ls())

#--------------predictor and target variable names--------#
	predictor.vars <- <PREDICTOR> 
	target.var <- <TARGET>
#--------------grid region, mask settings----------#
        grid <- <OP.GRID> 
        spat.mask.dir_1 <- <SPAT.MASK.DIR> 
        spat.mask.var <- <SPAT.MASK.VAR> 
	ds.region <- <DS.REGION>
#--------------- I,J settings ----------------#
        file.j.range <- <JRANGE> 
        i.file <- <ISUFFIX>   
        j.start <- <JSTART> 
        j.end <- <JEND> 
        loop.start <-  j.start - (j.start-1)
        loop.end <-  j.end - (j.start-1)
#------------ historical predictor(s)----------# 
	hist.file.start.year_1 <- <H.FILE.START.YEAR> 
	hist.file.end.year_1 <- <H.FILE.END.YEAR>
        hist.train.start.year_1 <- <H.TRAIN.START.YEAR>
	hist.train.end.year_1 <- <H.TRAIN.END.YEAR> 
	hist.scenario_1 <- <H.SCENARIO>
	hist.nyrtot_1 <- (hist.train.end.year_1 - hist.train.start.year_1) + 1
	hist.model_1 <- <H.MODEL> 
	hist.freq_1 <- <H.FREQ> 
	hist.indir_1 <- <H.INDIR> 
	hist.time.window <- <H.TIME.WINDOW> 
#------------ future predictor(s) -------------# 
	fut.file.start.year_1 <- <F.FILE.START.YEAR> 
	fut.file.end.year_1 <- <F.FILE.END.YEAR> 
        fut.train.start.year_1 <- <F.TRAIN.START.YEAR> 
        fut.train.end.year_1 <- <F.TRAIN.END.YEAR> 
	fut.scenario_1 <- <F.SCENARIO>
	fut.nyrtot_1 <- (fut.train.end.year_1 - fut.train.start.year_1) + 1
	fut.model_1 <- <F.MODEL> 
	fut.freq_1 <- <F.FREQ> 
	fut.indir_1 <- <F.INDIR>
	fut.time.window <- <F.TIME.WINDOW>
        fut.time.trim.mask <- <FUT.TIME.TRIM.MASK>
#------------- target -------------------------# 
	target.file.start.year_1 <- <T.FILE.START.YEAR> 
	target.file.end.year_1 <- <T.FILE.END.YEAR> 
        target.train.start.year_1 <- <T.TRAIN.START.YEAR> 
        target.train.end.year_1 <- <T.TRAIN.END.YEAR> 
	target.scenario_1 <- <T.SCENARIO>
	target.nyrtot_1 <- (target.train.end.year_1 - target.train.start.year_1) + 1 
	target.model_1 <- <T.MODEL>
	target.freq_1 <- <T.FREQ> 
        target.indir_1 <- <T.INDIR>
	target.time.window <- <T.TIME.WINDOW>
#------------- method name k-fold specs-----------------------#
        ds.method <- <METHOD> 
	ds.experiment <- <DEXPER> 
	k.fold <- <KFOLD> 
	<PR_OPTS>
#-------------- output -----------------------#
	output.dir <- <OUTPUT.DIR>
	mask.output.dir <- <MASK.OUTPUT.DIR> 
#-------------  custom -----------------------#
        <PARAMS> 
 #Number of "cuts" for which quantiles will be empirically estimated (Default is 100 in CDFt package).
#-------------- pp ---------------------------#
        mask.list <- <MASK.LIST>
################### others ###################################
#---------------- reference to go in globals ----------------------------------- 
	configURL <-' Ref:http://gfdl.noaa.gov/esd_experiment_configs'
# ------ Set FUDGE environment ---------------
#	FUDGEROOT = Sys.getenv(c("FUDGEROOT"))
	FUDGEROOT <- <FUDGEROOT>
	print(paste("FUDGEROOT is now activated:",FUDGEROOT,sep=''))
	BRANCH <- <BRANCH>
################ call main driver ###################################
print(paste("START TIME:",Sys.time(),sep=''))

#----------Use /vftmp as necessary---------------# 
TMPDIR = Sys.getenv(c("TMPDIR"))
if (TMPDIR == ""){
  stop("ERROR: TMPDIR is not set. Please set it and try it") 
  }
#########################################################################
if(spat.mask.dir_1 != 'na'){
if((grepl('^/archive',spat.mask.dir_1)) | (grepl('^/work',spat.mask.dir_1))){
spat.mask.dir_1 <- paste(TMPDIR,spat.mask.dir_1,sep='')
}}
if(hist.indir_1 != 'na'){
if((grepl('^/archive',hist.indir_1)) | (grepl('^/work',hist.indir_1))){
hist.indir_1 <- paste(TMPDIR,hist.indir_1,sep='')
}}
if(fut.indir_1 != 'na'){
if((grepl('^/archive',fut.indir_1)) | (grepl('^/work',fut.indir_1))){
fut.indir_1 <- paste(TMPDIR,fut.indir_1,sep='')
}}
if(hist.indir_1 != 'na'){
if((grepl('^/archive',hist.indir_1)) | (grepl('^/work',hist.indir_1))){
target.indir_1 <- paste(TMPDIR,target.indir_1,sep='')
}}
if(target.time.window != 'na'){
if((grepl('^/archive',target.time.window)) | (grepl('^/work',target.time.window))){
target.time.window <- paste(TMPDIR,target.time.window,sep='')
}}
if(hist.time.window != 'na'){
if((grepl('^/archive',hist.time.window)) | (grepl('^/work',hist.time.window))){
hist.time.window <- paste(TMPDIR,hist.time.window,sep='')
}}
if(fut.time.window != 'na'){
if((grepl('^/archive',fut.time.window)) | (grepl('^/work',fut.time.window))){
fut.time.window <- paste(TMPDIR,fut.time.window,sep='')
}}
if(fut.time.trim.mask != 'na'){
if((grepl('^/archive',fut.time.trim.mask)) | (grepl('^/work',fut.time.trim.mask))){
fut.time.trim.mask <- paste(TMPDIR,fut.time.trim.mask,sep='')
}
}
output.dir <- paste(TMPDIR,output.dir,sep='')
mask.output.dir <- paste(TMPDIR,mask.output.dir,sep='')

#########################################################################
#-------------------------------------------------#
#source(paste(FUDGEROOT,'Rsuite/Drivers/',ds.method,'/Driver_',ds.method,'.R',sep=''))
source(paste(FUDGEROOT,'Rsuite/Drivers/','Master_Driver.R',sep=''))
