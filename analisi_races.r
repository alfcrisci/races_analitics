##################################################################################
# Authors : Alfonso Crisci & Valentina Grasso
# IBIMET CNR Institute of Biometeorology Firenze via caproni 8,50145,Italia                              
# Mail: a.crisci@ibimet.cnr.it
# file: analisi_races.r
# Github: https://github.com/alfcrisci/races_analitics
# Title: Evaluating communication efforts and urban climate constraints for energy savings. The experience of RACES project in 5 italian cities 
##################################################################################

##################################################################################
# Loading required R packages. Install them if is necessary from CRAN packages' repository.
 

library(Rcmdr)
library(relaimpo)

###############################################################################
# Setup directory working dir (to modify if necessary

setwd("C:\\Users\\Alf\\Documents\\GitHub\\races_analitics")



#########################################################################
# Data reading and data.frame creation
 
races_valid <- read.csv("matrix_valid_data.csv", header=TRUE, na.strings="NA")

#########################################################################
# GLM modeling

GLM.ELE <- glm(CB_ene_08~ HDD_2008+CDD_2008+MQ+ Componenti, family=gaussian(identity), data=races_valid)
GLM.ELE <-stepAIC(GLM.ELE)
summary(GLM.ELE)


GLM.RIS <- glm(CB_ris_08  ~ HDD_2008+MQ+Tipo_Abitazione+ Componenti + Finestre, family=gaussian(identity), data=races_valid)
GLM.RIS <-stepAIC(GLM.RIS)
summary(GLM.RIS)

GLM.MOB <- glm(CB_mob_08 ~ gp_2008+ Componenti , family=gaussian(identity), data=races_valid)
GLM.MOB <-stepAIC(GLM.MOB)

summary(GLM.ELE)
summary(GLM.RIS)
summary(GLM.MOB)

GLM.ELE <- glm(CB_ene_08~ MQ+ Componenti, family=gaussian(identity), data=races_valid)
plot(calc.relimp(GLM.ELE,type=c("lmg"),rela=TRUE),main="Importance of factors \n for CB electricity ") 
GLM.RIS <- glm(CB_ris_08  ~ HDD_2008+MQ+ Componenti , family=gaussian(identity), data=races_valid)
plot(calc.relimp(GLM.RIS,type=c("lmg"),rela=TRUE),main="Importance of factors \n for CB heating ") 
GLM.MOB <- glm(CB_mob_08 ~ gp_2008+ Componenti , family=gaussian(identity), data=races_valid)
plot(calc.relimp(GLM.MOB,type=c("lmg"),rela=TRUE),main="Importance of factors \n for CB mobility ") 
