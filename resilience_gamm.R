#code to fit gamm models to GSOEP life satisfaction data
#bruce doré

#packages
require(mgcv)

#import data
div<-read.csv("~/div.csv")
wid<-read.csv("~/wid.csv")
empred<-read.csv("~/empred.csv")

#fixed effect of time, no varying parameters
div_fe_bam <- bam(wbeing_div ~ s(year_div, k = 48), data=div)
wid_fe_bam <- bam(wbeing_wid ~ s(year_wid, k = 48), data=wid)
emp_fe_bam <- bam(wbeing_emp ~ s(year_emp, k = 48), data=empred)

#varying intercept
div_vi_bam <- bam(wbeing_div ~ s(year_div, k=48) + s(subj_div, bs="re"), data=div)
wid_vi_bam <- bam(wbeing_wid ~ s(year_wid, k=48) + s(subj_wid, bs="re"), data=wid)
emp_vi_bam <- bam(wbeing_emp ~ s(year_emp, k=48) + s(subj_emp, bs="re"), data=empred)

#varying intercept and slope
div_vivs_bam <- bam(wbeing_div ~ s(year_div, k=48) + s(subj_div, bs="re") + s(subj_div, year_div, bs="re"), data=div)
wid_vivs_bam <- bam(wbeing_wid ~ s(year_wid, k=48) + s(subj_wid, bs="re") + s(subj_wid, year_wid, bs="re"), data=wid)
emp_vivs_bam <- bam(wbeing_emp ~ s(year_emp, k=48) + s(subj_emp, bs="re") + s(subj_emp, year_emp, bs="re"), data=empred)

#varying curve 
div_vsm_bam<-bam(wbeing_div ~ s(year_div, k = 48) + s(year_div, subj_div, bs = "fs"), data=div)
wid_vsm_bam<-bam(wbeing_wid ~ s(year_wid, k = 48) + s(year_wid, subj_wid, bs = "fs"), data=wid)
emp_vsm_bam<-bam(wbeing_emp ~ s(year_emp, k = 48) + s(year_emp, subj_emp, bs = "fs"), data=empred)






