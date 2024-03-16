# kali-sec

![Logo](https://ka-tet.s3.amazonaws.com/docker.png)                                                                                                                                           

![Logo](https://img.shields.io/docker/image-size/fonalex45/kali-sec)                                                                                                                             
![Logo](https://img.shields.io/docker/pulls/fonalex45/kali-sec)       

## Repeatable, immutable, and scalable Security Research w/ Docker 
## Acknowledgements

 I pulled alot of inspiration from this awesome project and can only hope my project is as awesome as this one is.
 
- [Exegol - Fully featured and community-driven hacking environment](https://github.com/ThePorgs/Exegol)

## Features

- Bash functions for easy spin up and spin down
- Command history logging via script
- Persistant containers, volumes and workspaces
- Customizable resources and tooling, config files are located in the `resources/` & `sources/` directories
- Non-root container w/ sudo
- Tmux inside the container

### Custom aliases included:



| alias      | command |
|------------|-----------------------------------------------|
| http       | 'sudo python3 -m http.server 80'              |
| reload     | '. ~/.bashrc'                                  |
| update     | 'sudo apt-get update'                         |
| t          | 'tmux -f ~/.tmux.conf'                        |
| i          | 'sudo apt-get install'                        |
| public     | 'curl wtfismyip.com/text'                     |
| py         | 'python3                                      |


## Installation

1. `git clone https://github.com/alexrf45/kali-sec.git && cd kali-sec`

2. Copy the kali function script to a desired location:

**Example:**

```bash
$ cp kali.sh ~/.zsh/. 
```

3. Source the script in .zshrc or desired shell:

**Example:**

`echo 'source "$HOME/.zsh/kali.sh"' >> .zshrc`

4. Refresh the shell:

Example: 
```bash
. ~/.bashrc or . ~/.zshrc
```

## Usage/Examples

Spawn a new container: `kali <CONTAINER_NAME>`

Start an existing container: `start <CONTAINER_NAME>`

Enter an existing container: `enter <CONTAINER_NAME>`

Stop an existing container: `stop <CONTAINER_NAME>`

Destroy an existing container: `destroy <CONTAINER_NAME>`

Update image **This will not update the image of an existing container, only for new ones**: 
`pull`

Command list:

- Tired of looking for a specific command or long one liner? You can use this handy alias to search the prebuilt history for commonly used commands

```
alias command='cat $HOME/.commands'
```

TODO:
- add quick https server script
- Python wrapper
- slim testing
