# Distributed .NET Core

![DevMentors](https://github.com/devmentors/DNC-DShop/blob/master/assets/devmentors_logo.png)

**What is Distributed .NET Core?**
----------------

It's an open source project (and a course available soon at [devmentors.io](https://devmentors.io)), providing in-depth knowledge about building microservices using [.NET Core](https://www.microsoft.com/net/learn/get-started-with-dotnet-tutorial) framework and variety of tools. One of the goals, was to create a cloud agnostic solution, that you shall be able to run anywhere. 

We encourage you to join our [Discourse](https://www.discourse.org) forum available at [forum.devmentors.io](https://forum.devmentors.io).

For this particular course, please have a look at the topics being discussed under this [category](https://forum.devmentors.io/c/courses/distributed-dotnet-core).


**What topics will be discussed?**
----------------

A lot of them, covering different aspects of building distributed services, whether it comes to implementing the code, managing services discovery and load balancing, configuring logging or monitoring, and eventually deploying to the VM using Docker.

Just to name a few:
- [RESTful API](https://www.restapitutorial.com) implementation with [ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/?view=aspnetcore-2.1)
- [Domain Driven Design](http://dddcommunity.org) fundamentals
- SQL and NoSQL databases ([SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-2017), [MongoDB](https://www.mongodb.com), [InfluxDB](https://www.influxdata.com))
- Distributed caching with [Redis](https://redis.io)
- [API Gateway](https://microservices.io/patterns/apigateway.html) and other patterns designed for microservices
- [JWT](https://jwt.io), authentication, authorization
- Communication via websockets using [SignalR](https://docs.microsoft.com/en-us/aspnet/core/signalr/?view=aspnetcore-2.1)
- [CQRS](https://martinfowler.com/bliki/CQRS.html), Commands, Queries & Events handlers
- Using [RabbitMQ](https://www.rabbitmq.com) as a message queue with [RawRabbit](https://github.com/pardahlman/RawRabbit)
- Dealing with asynchronous requests, Process Managers and Sagas
- Internal HTTP communication with [RestEase](https://github.com/canton7/RestEase)
- Service discovery with [Consul](https://www.consul.io)
- Storing secrets with [Vault](https://www.vaultproject.io)
- Monitoring with [App Metrics](https://www.app-metrics.io), [Grafana](https://grafana.com), [Prometheus](https://prometheus.io) and [Jaeger](https://www.jaegertracing.io)
- Logging with [Serilog](https://serilog.net), [Seq](https://getseq.net) and [ELK stack](https://www.elastic.co/elk-stack)
- Building [Docker](https://www.docker.com) images, managing containers, networks and [registries](https://hub.docker.com)
- Defining [Docker compose](https://docs.docker.com/compose) stacks
- Managing your own Nuget feeds (e.g. [MyGet](https://myget.org))
- CI & CD with build services such as [Travis CI](https://travis-ci.org), [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) or [VSTS](https://visualstudio.microsoft.com/pl/team-services)
- Deploying services to the Linux Servers and configuring [Nginx](https://www.nginx.com)
- Orchestrating services on your VM or in the Cloud using [Portainer](https://portainer.io) or [Rancher](https://rancher.com) (built on top of [Kubernetes](https://kubernetes.io))

**Which repositories should I clone?**
----------------

Please clone the following repositories and put them into the same working directory:

- [DNC-DShop](https://github.com/devmentors/DNC-DShop)
- [DNC-DShop.Api](https://github.com/devmentors/DNC-DShop.Api)
- [DNC-DShop.Common](https://github.com/devmentors/DNC-DShop.Common)
- [DNC-DShop.Services.Identity](https://github.com/devmentors/DNC-DShop.Services.Identity)
- [DNC-DShop.Services.Customers](https://github.com/devmentors/DNC-DShop.Services.Customers)
- [DNC-DShop.Services.Notifications](https://github.com/devmentors/DNC-DShop.Services.Notifications)
- [DNC-DShop.Services.Operations](https://github.com/devmentors/DNC-DShop.Services.Operations)
- [DNC-DShop.Services.Orders](https://github.com/devmentors/DNC-DShop.Services.Orders)
- [DNC-DShop.Services.Products](https://github.com/devmentors/DNC-DShop.Services.Products)
- [DNC-DShop.Services.SignalR](https://github.com/devmentors/DNC-DShop.Services.SignalR)

**How to start the solution?**
----------------

At first, you need to have the following services up and running on localhost (so-called bare minimum):

- [MongoDB](https://www.mongodb.com)
- [RabbitMQ](https://www.rabbitmq.com)
- [Redis](https://redis.io)

These can be run as standalone services, or via Docker (recommended approach). 
You can run them one by one e.g.

```docker
docker run --name mongo -d -p 27017:27017 mongo:4
```

```docker
docker run --name rabbitmq -d -p 5672:5672 -p 15672:15672 --hostname rabbitmq rabbitmq:3-management
```

```docker
docker run --name redis -d -p 6379:6379 redis
```

Or using Docker compose (first, create a new `docker-compose.yml` file and then execute `docker-compose up` command):

```yml
version: "3.5"

services:
  mongo:
    image: mongo:4
    ports:
      - '27017:27017'

  rabbitmq:
    image: rabbitmq:3-management
    ports:
      - '5672:5672'
      - '15672:15672'

  redis:
    image: redis
    ports:
      - '6379:6379'
```

You can also find this file [here](https://github.com/devmentors/DNC-DShop/blob/master/compose/mongo-rabbit-redis.yml), which includes custom network and volumes. In order to start it, execute `docker-compose -f mongo-rabbit-redis.yml up -d` (`-d` will run containers in the background).

If you want to start additional infrastructural services e.g. Consul, Fabio and Vault, execute `docker-compose -f consul-fabio-vault.yml up -d` command.

Once you have the core infrastructure available, you can start a particular `DNC` project either by executing `dotnet run` command in `/src/PROJECT_NAME/` directory or starting a shell script `./scripts/dotnet-run.sh` from the root project directory. 
The order of starting the services has no meaning whatsoever - just keep in mind that `DShop.Api` acts as a [gateway](https://microservices.io/patterns/apigateway.html) to the whole system (except `DShop.Services.Identity`for authentication).

You should be able to see new topics and queues available in the RabbitMQ management system, default UI is accessible at [http://localhost:15672](http://localhost:15672).

In order to start the `DNC` services using Docker, run [docker-compose.yml](https://github.com/devmentors/DNC-DShop/blob/master/compose/docker-compose.yml) file, that will pull the images from [hub.docker.com/r/devmentors/](https://hub.docker.com/r/devmentors/).

You can also build you own local images easily, either run `dotnet-build-local-all.sh`, then `dotnet-publish-all.sh` then `docker-build-local-all.sh` scripts or just `docker-build-local-multistage-all.sh` (that will use Dockerfile.multistage instead of default Dockerfile).

Once the local images are built, run compose command for [docker-compose-local.yml](https://github.com/devmentors/DNC-DShop/blob/master/compose/docker-compose-local.yml).

Eventually, you can type `docker inspect dshop-network` to see if everything is in place.

**Where can I find the list of all Docker images being used?**
----------------

You can find them in this repository listed in [docker-images.txt](https://github.com/devmentors/DNC-DShop/blob/master/docker-images.txt) file.

Moreover, in the `scripts` directory, you can find [git-clone-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/git-clone-all.sh), [git-pull-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/git-pull-all.sh), [dotnet-build-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/dotnet-build-all.sh) or [dotnet-run-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/dotnet-run-all.sh)
scripts that might be helpful for the repeating tasks.

**What HTTP requests can be sent to the API?**
----------------

You can find the list of all HTTP requests in `DShop.rest` file placed in the root folder of [DShop.Api](https://github.com/devmentors/DNC-DShop.Api) repository ([here](https://github.com/devmentors/DNC-DShop.Api/blob/master/DShop.rest)). 
This file is compatible with [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) plugin for [Visual Studio Code](https://code.visualstudio.com). 
