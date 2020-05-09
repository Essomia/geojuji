# Setup a Docker environment

**Table of content:**

1. [Install Docker and VirtualBox](#1-install-docker-and-virtualbox)
1. [Create a Docker Machine](#2-create-a-docker-machine)
1. [Check your setup](#3-check-your-setup)

---

## 1. Install Docker and VirtualBox

First be sure to have the latest Homebrew and Cask installed, then, install `docker`.

```
brew install docker
```

Since you will also need to define your application containers, install `docker-compose`.

```
brew install docker-compose
```

Also, the `docker` binary is only a client on MacOS. As you can't use it to run the docker daemon, you have to install `docker-machine` in order to create VMs and attach them to it.

```
brew install docker-machine
```

Once done, you will need to install a driver for your virtual machine. I will be using VirtualBox.

```
brew cask install virtualbox
```

## 2. Create a Docker Machine

First, create a docker machine with the correct driver for Boot2Docker.

```
# Create a new docker machine with the virtual driver
docker-machine create --driver=virtualbox default

# Check that your docker machine have been created and is running
docker-machine ls
```

Then, connect the `docker` client and the new docker machine.

```
# Connect the docker client and the docker machine
docker-machine env default

# Configure your shell to use the docker machine
eval $(docker-machine env default)

# Get the IP adress from the docker machine (if needed)
docker-machine ip default
```

:notebook: Note that I used `default` as my docker virtual machine name, but you can use any name you like.

```
docker-machine create --driver=vmwarefusion <my-custom-name>
docker-machine env <my-custom-name>
eval $(docker-machine env <my-custom-name>)
docker-machine ip <my-custom-name>
```

:notebook: Below you have some docker machine usefull command:

```
# Start virtual machine for docker
docker-machine start

# Stop virtual machine for docker
docker-machine stop default

# It's helps to get environment variables
docker-machine env

# Set environment variables
eval "$(docker-machine env default)"
```

## 3. Check your setup

Finally, let’s check that all installation process is achieved correctly!

```
docker run hello-world
```

It should work!

:notebook: All the files are created in the `~/.docker/` folder.
