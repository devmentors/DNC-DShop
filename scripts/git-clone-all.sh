#!/bin/bash
REPOSITORIES=(DNC-DShop DNC-DShop.Api DNC-DShop.Api.Next DNC-DShop.Common DNC-DShop.Services.Customers DNC-DShop.Services.Identity DNC-DShop.Services.Notifications DNC-DShop.Services.Operations DNC-DShop.Services.Orders DNC-DShop.Services.Products DNC-DShop.Services.Signalr)

if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n"; git clone https://github.com/devmentors/{}.git'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Cloning repository: $REPOSITORY
      echo ========================================================
      REPO_URL=https://github.com/devmentors/$REPOSITORY.git
      git clone $REPO_URL
    done
fi