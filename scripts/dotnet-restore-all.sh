#!/bin/bash
REPOSITORIES=(DNC-DShop.Api DNC-DShop.Common DNC-DShop.Messages DNC-DShop.Services.Customers DNC-DShop.Services.Identity DNC-DShop.Services.Notifications DNC-DShop.Services.Operations DNC-DShop.Services.Orders DNC-DShop.Services.Products DNC-DShop.Services.Signalr)
for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Updating repository: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     dotnet build
     cd ..
done
