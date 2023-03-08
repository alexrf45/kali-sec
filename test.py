import docker
import sys
import requests


# client.images.pull("fonalex45/katet:latest")

client = docker.DockerClient(base_url='unix://var/run/docker.sock')

ENVIRONMENT = ["NAME=$NAME", "TARGET=$TARGET", "IP=$IP", "DOMAIN=$DOMAIN"]


def container_run(rm):
    client.containers.run('fonalex45/katet:latest',
                          entrypoint="/bin/zsh",
                          environment=ENVIRONMENT,
                          remove=rm
                          )


container_run(True)
