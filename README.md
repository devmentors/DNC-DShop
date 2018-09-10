# Distributed .NET Core

![DevMentors](https://github.com/devmentors/DNC-DShop/blob/master/assets/devmentors_logo.png)

**What is Distributed .NET Core?**
----------------

It's an open source project (and a course available soon at [devmentors.io](https://devmentors.io)), providing in-depth knowledge about building microservices using .NET Core framework and variety of tools. One of the goals, was to create a cloud agnostic solution, that you shall be able to run anywhere. 

We encourage you to join our [Discourse](https://www.discourse.org) forum available at [forum.devmentors.io](https://forum.devmentors.io).

For this particular course, please have a look at the topics being discussed under this [category](https://forum.devmentors.io/c/courses/distributed-dotnet-core).


**What topics are being discussed?**
----------------

A lot of them, covering different aspects of building distributed services, whether it comes to implementing the code, managing services discovery and load balancing, configuring logging or monitoring, and eventually deploying to the VM using Docker.

Just to name a few:
- RESTful API implementation with ASP.NET Core
- Domain Driven Design fundamentals
- SQL and NoSQL databases (SQL Server, MongoDB)
- Distributed caching with Redis
- Communication via websockets using SignalR
- CQRS, Commands & Events handlers
- Using RabbitMQ as a message queue
- Orchestrating messages and asynchronous requests
- Process managers and Sagas
- Internal HTTP communication with RestEase
- Service discovery with Consul
- Storing secrets with Vault
- Monitoring with App Metrics, Grafana, Prometheus and InfluxDB
- Logging with Seq and ELK stack
- Building Docker images
- Defining Docker compose stacks
- Deploying to the VM with Rancher (on top of Kubernetes)

**Which repositories should I clone?**
----------------

Please clone the following repositories and put them into the same working directory:

- [DNC-DShop](https://github.com/devmentors/DNC-DShop.Common)
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

You can also find this file [here](https://github.com/devmentors/DNC-DShop/blob/master/compose/docker-compose-infrastructure.yml), which includes custom network and volumes. In order to start it, execute `docker-compose -f docker-compose-infrastructure.yml up -d` (`-d` will run containers in the background).

Once you have the core infrastructure available, you can start a particular `DNC` project either by executing `dotnet run` command in `/src/PROJECT_NAME/` directory or starting a shell script `./scripts/start.sh` from the root project directory. 
The order of starting the services has no meaning whatsoever - just keep in mind that `DShop.Api` acts as a [gateway](https://microservices.io/patterns/apigateway.html) to the whole system (except `DShop.Services.Identity`for authentication).

You should be able to see new topics and queues available in the RabbitMQ management system, default UI is accessible at [http://localhost:15672](http://localhost:15672).

**Where can I find the list of all Docker images being used?**
----------------

You can find them in this repository listed in [docker-images.txt](https://github.com/devmentors/DNC-DShop/blob/master/docker-images.txt) file.

Moreover, in the `scripts` directory, you can find [git-clone-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/git-clone-all.sh), [git-pull-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/git-pull-all.sh), [dotnet-build-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/dotnet-build-all.sh) or [dotnet-start-all.sh](https://github.com/devmentors/DNC-DShop/blob/master/scripts/dotnet-start-all.sh)
scripts that might be helpful for the repeating tasks.