import docker

client = docker.from_env()


ENVIRONMENT = ["NAME=$NAME", "TARGET=$TARGET", "IP=$IP", "DOMAIN=$DOMAIN"]

NAME = input("Enter Container Name: ")
# def container_run():

try:

    client.containers.run("fonalex45/katet:latest",
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
