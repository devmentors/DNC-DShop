#!/bin/bash
REPOSITORIES=(DNC-DShop DNC-DShop.Api DNC-DShop.Common DNC-DShop.Messages DNC-DShop.Services.Customers DNC-DShop.Services.Identity DNC-DShop.Services.Notifications DNC-DShop.Services.Operations DNC-DShop.Services.Orders DNC-DShop.Services.Products DNC-DShop.Services.Signalr DNC-DShop.Services.Storage DNC-DShop.Monolith DNC-DShop.Web)
cd ../..
pwd
for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Cloning repository: $REPOSITORY
	 echo ========================================================
	 REPO_URL=https://github.com/devmentors/$REPOSITORY.git
	 git clone $REPO_URL
done
