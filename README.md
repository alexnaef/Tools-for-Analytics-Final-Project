# Tools-for-Analytics-Final-Project
Group Name: 7
Group Members: UNIs: [dta2112 (eskimobro), aen2145 (alexnaef)

Description: We started off by implementing all the logistics for the project. Downloading packages we needed, imporing them as such, and then finally setting up the PostGres DB and setting up our NYC_Data token.
We then prepared for data loading. First we locally downloaded all the datasets and then for trees and complaints, we used the API to download the larger datasets through  the NYC data website.
After downloading the data, we cleaned the data using pandas and geopandas where applicable.
Next step was storing all the data in postgres and making our database universially accessible. We had some issues with the large volume of data, so most of the testing and implementation was done from 1 laptop, but in collaboration, hence the slight mismatch in commits.
After getting our database in order, we could query data inside the DB. This was done through simple Postgres queries and using the python engines to run those.
Final part was the visualization which happened mostly in python, first by quering the data using Postgres, then formatting the data nicely using pandas and geopandas.
