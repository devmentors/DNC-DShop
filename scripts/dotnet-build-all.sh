#!/bin/bash
export ASPNETCORE_ENVIRONMENT=local
BUILD=./scripts/dotnet-build.sh
PREFIX=DNC-DShop
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.Api $PREFIX.Common $SERVICE.Customers $SERVICE.Identity $SERVICE.Notifications $SERVICE.Operations $SERVICE.Orders $SERVICE.Products $SERVICE.Signalr)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a project: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $BUILD
     cd ..
done