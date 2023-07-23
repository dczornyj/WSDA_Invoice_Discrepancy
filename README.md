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

![Screenshot (248)](https://github.com/dczornyj/WSDA_Invoice_Discrepancy/assets/101612220/0ac3b823-8c9f-43cf-bf67-c5e5bfa54a1f)





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


## Analysis

-From Upper Management's initial prognosis of a financial discrepancy sometime between 2011-2012, figure 5 verifies this by showing that during 2011 the average Transaction amount of songs purchased by customers was an outlier amongst the rest of the years (average transaction amount of $15.71). In observing this, I then queried the average transaction amounts per sale based on WSDA Sales rep but only displaying average transaction amounts that were greater than the average transaction amount between 2011-2012 (figure 7). From this information, I saw that the transactions Jane Peacock facilitated were a massive outlier within these constraints that I had applied. By digging deeper into the invoice record attached to Jane Peacock, I found out that John Doeein's maximum invoice of $100.86 was particularly alarming. This record required further investigation. 

After looking into John Doeein's transaction history within WSDA'S database, I observed that John had only ever made one purchase during the years of concern. By looking at this customer's record I was suspicious in finding out that WSDA knows nothing about this customer except for their name, as seen in Figure 12. From this exploratory analysis, it is clear that John Doeein is WSDA's person of interest in regard to the company's concern about a financial discrepancy between 20122-2012. Due to the lack of information documented about this customer in addition to financial transaction details tied to the customer being a huge outlier within the dataset, one cannot trust this transaction with 100% validity. There is a large possibility that the transaction made under the customer name "John Doeein" is fraudulent and thus requires further investigation in order to increase company security and prevent discrepancies like this from occurring in the future. 
