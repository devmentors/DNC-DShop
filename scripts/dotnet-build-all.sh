#!/bin/bash
REPOSITORIES=(DNC-DShop.Api DNC-DShop.Common DNC-DShop.Messages DNC-DShop.Services.Customers DNC-DShop.Services.Identity DNC-DShop.Services.Notifications DNC-DShop.Services.Operations DNC-DShop.Services.Orders DNC-DShop.Services.Products DNC-DShop.Services.Signalr DNC-DShop.Services.Storage)
for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a solution: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     git checkout develop
     dotnet build
     cd ..
done