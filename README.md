# WSDA_Invoice_Discrepancy
- Exploratory analysis of a perceived financial discrepancy between the years of 2011 and 2012 from Upper Management pertaining to WSDA music sales. My exploratory analysis
  includes the use of SQL Lite and DB Browser in order to investigate WSDA's database and discover what is causing the inconsistency in WSDA's financial records


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# Queried Results from Code (figure numbers correspond to steps in my analysis)

## Figure 5
-Average Transaction Amount of WSDA Music Sales by Year

![Screenshot (249)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/10faa285-9279-4f29-b892-ee53fb4bd0e8)




## Figure 6
-List of transactions that were greater than the average transaction amount from the outlying year of 2011

![Screenshot (247)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/f0cbe1fe-60f7-4ee3-8e47-2b114316c0a6)
![Screenshot (248)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/9ec0b65b-5c23-4ee3-a901-ac05cc794f4d




## Figure 7
-Querying Sales reps whose Average Transaction Amount per sale exceeded the average Transaction Amount across all WSDA sales reps between 2011-2012

![Screenshot (251)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/2480c589-9bfe-453d-8faf-2f9366a40f75)




## Figure 11
-Displaying the Maximum purchase amount for Customers for whom Jane Peacock was Sales Rep for


![Screenshot (252)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/724bb678-086d-4d4f-81c6-7f1b5e2fbdda)
![Screenshot (253)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/98c3805b-ebfe-4181-8a98-088a69b3e32d)

## Figure 12
-Querying the Customer record for John Doeein


![Screenshot (254)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/4947e899-7e71-41f3-886f-4cf80f1bd5d0)



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


## Results from Investigative Querying

















## Analysis


-- 11)  Look at this customer record—do you see anything suspicious? 

-- Yes, during the time period in question (2011-2012), John Doeein only ever made one purchase and it was for the max total as shown in the above question. Also, the only personal information that exists in our database regarding this customer is their name which is extremely suspicious.


-- 12)  Who do you conclude is our primary person of interest?

-- John Doeein is our primary person of interest as we cannot be sure whether this transaction is 100% trustworthy (it may be fraudulent). 
