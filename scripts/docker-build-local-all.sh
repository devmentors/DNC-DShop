#!/bin/bash
BUILD=./scripts/docker-build-local.sh
PREFIX=DNC-DShop
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.Api $PREFIX.Api.Next $SERVICE.Customers $SERVICE.Identity $SERVICE.Notifications $SERVICE.Operations $SERVICE.Orders $SERVICE.Products $SERVICE.Signalr)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a local Docker image: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $BUILD
     cd ..
done