Races Analitics
================

Code for Generalized Linear Modeling of "Annual carbon Budeget" (CB) related to the three sectors of household energy consumption: Electricity, Heating and Mobility 
In collaboration to Dott. Valentina Grasso v.grasso@ibimet.cnr.it

=======

Work title: Evaluating communication efforts and urban climate constraints for energy savings. The experience of RACES project in 5 italian cities 

This repository have the data and R code for reproducible examples presented in the paper.

Results by each sectors using wald test on predictors: Surface : MQ; Number of family components : Componenti ;heating degree days ( 18 °C ) of 2008 : HDD_2008, Number of rainy days : gp_2008.

A) Modeling  Carbon budget 2008  Home - Electricity
==================================================


GLM formula = CB_ene_08 ~ HDD_2008 + CDD_2008 + MQ + Componenti + as.factor(Lavastoviglie) + as.factor(Condizionatore), family = gaussian(identity), data = races_valid

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-1883.91   -409.51    -87.45    395.54   2279.02  

Coefficients:
                                 Estimate Std. Error t value Pr(>|t|)    
(Intercept)                    -3521.7715  3061.6307  -1.150 0.251629    
HDD_2008                           0.7844     0.6801   1.153 0.250409    
CDD_2008                           2.8867     2.3542   1.226 0.221812    
MQ                                 8.4285     1.5272   5.519 1.24e-07 ***
Componenti                       189.4019    47.8016   3.962 0.000109 ***
as.factor(Lavastoviglie)[T.1]    134.7873   108.2242   1.245 0.214672    
as.factor(Condizionatore)[T.1]   -71.0683   137.1752  -0.518 0.605069    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 


    Null deviance: 114652323  on 177  degrees of freedom
Residual deviance:  81151942  on 171  degrees of freedom
  (6 observations deleted due to missingness due to absent metadata )
AIC: 2840.5


B) Modeling  Carbon budget 2008  Home - Heating
==================================================


GLM formula = CB_ris_08 ~ HDD_2008 + MQ + Componenti, family = gaussian(identity), data = races_valid

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2064.8   -661.1   -138.3    590.8   3500.3  

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1156.4471   440.5948  -2.625  0.00942 ** 
HDD_2008        0.8727     0.2103   4.149 5.14e-05 ***
MQ             12.2113     2.3081   5.291 3.51e-07 ***
Componenti    192.6499    73.8197   2.610  0.00982 ** 
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

    Null deviance: 295492254  on 183  degrees of freedom
Residual deviance: 211155703  on 180  degrees of freedom
AIC: 3099.6



C) Modeling  Carbon budget 2008  Mobility 
==================================================


GLM formula = CB_mob_08 ~ gp_2008 + Componenti, family = gaussian(identity), data = races_valid

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-4668.2  -1977.7   -639.6   1408.3  13530.1  

Coefficients:
            Estimate Std. Error t value Pr(>|t|)  
(Intercept)  453.743   1218.483   0.372   0.7100  
gp_2008       15.992      9.157   1.747   0.0824 . (weak)
Componenti   493.693    193.456   2.552   0.0115 *
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 


    Null deviance: 1689821577  on 183  degrees of freedom
Residual deviance: 1600100854  on 181  degrees of freedom
AIC: 3470.2

