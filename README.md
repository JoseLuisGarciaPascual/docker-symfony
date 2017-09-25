# Docker Environment (PHP7-FPM - NGINX - MySQL -MongoDB - ELK)

![](doc/schema.png)

This stack its based in the work of https://github.com/maxpou/docker-symfony

#Description

This fork simply add MongoDB and some usefull makefile commands to the original repository.

#Installation

Create a `.env` from the `.env.dist` file. Adapt it according to your local environment

```bash
cp .env.dist .env
```

Build/run/prepare containers with

```bash
$ make install
```

3. Update your system host file (add symfony.dev)

```bash
# UNIX only: get containers IP address and update host (replace IP according to your configuration)
$ docker network inspect bridge | grep Gateway

# unix only (on Windows, edit C:\Windows\System32\drivers\etc\hosts)
$ sudo echo "171.17.0.1 symfony.dev" >> /etc/hosts
```

**Note:** For **OS X**, please take a look [here](https://docs.docker.com/docker-for-mac/networking/) and for **Windows** read [this](https://docs.docker.com/docker-for-windows/#/step-4-explore-the-application-and-run-examples) (4th step).

Prepare your local aplication to connect to the docker services.For example, to call to get the MySQL database in a Symfony config you should use:

```yml
# app/config/parameters.yml
parameters:
    database_host: db
```

Where 'db', the service name, acts as an alias of the service host within the volume.

## Usage

Just run `make launch`, then:

* Symfony app: visit [symfony.dev](http://symfony.dev)  
* Symfony dev mode: visit [symfony.dev/app_dev.php](http://symfony.dev/app_dev.php)  
* Logs (Kibana): [symfony.dev:81](http://symfony.dev:81)
* Logs (files location): logs/nginx and logs/symfony

#Makefile

The app ships with a makefile that give the current options:

- launch: build/init the docker instances.
- regenerate-permissions: Regenerate the apps permisions to a docker usable status.
- reboot: Reboot the docker instances.

#Tips

To access to a container use

```bash
$ docker-compose exec -u <user> <service name> bash
```

We recommend access the container as www-data if possible, but the user parameter can be omitted.

#Needed upgrades

- Add security to mongoDB

