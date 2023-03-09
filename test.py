import logging
import json

import docker
from docker import DockerClient
from docker.errors import APIError, DockerException, NotFound, ImageNotFound
from docker.models.images import Image
from docker.models.volumes import Volume


ENVIRONMENT = ["NAME=$NAME", "TARGET=$TARGET", "IP=$IP", "DOMAIN=$DOMAIN"]

NAME = input("Enter Container Name: ")

__client = docker.from_env()

# Check if the docker daemon is serving linux


def katet_run():
    __daemon_info = __client.info()

    if __daemon_info.get("OSType", "linux").lower() != "linux":
        logging.critical(
            f"""Docker daemon is not serving a linux container !"
            "Docker OS Type is {__daemon_info.get('OSType', 'linux')}""")
    try:

        __client.containers.run("fonalex45/katet:latest",
                                entrypoint="/bin/zsh",
                                environment=ENVIRONMENT,
                                remove=True,
                                network_mode="host",
                                tty=True,
                                name=NAME
                                )

    except KeyboardInterrupt:
        print("\nContainer is running")
    else:
        print("Running")


katet_run()


def katet_attach():
    __client.containers.attach(NAME, stdin=True)


katet_attach()
