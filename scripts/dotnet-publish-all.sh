#!/bin/bash
export ASPNETCORE_ENVIRONMENT=local
PUBLISH=./scripts/dotnet-publish.sh
PREFIX=DNC-DShop
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.Api $PREFIX.Api.Next $SERVICE.Customers $SERVICE.Identity $SERVICE.Notifications $SERVICE.Operations $SERVICE.Orders $SERVICE.Products $SERVICE.Signalr)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Publishing a project: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $PUBLISH
     cd ..
done