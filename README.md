# Dockerized Binary Ninja (with GUI, persistent license, update handling)

This is my take on running Binary Ninja in Docker. Other implementations:
- https://github.com/KevOrr/binaryninja-docker (unmaintained?)
- https://github.com/cyberkaida/binaryninja-docker (headless)

## Features

- Shared X11 socket with the host so you can use the GUI (runs on Linux)
- Bind mounts the Binary Ninja directory to the container, so you can share your local installation
- Sets `$HOME` to the bind mounted `home` directory included in this repo, so license information and plugins are stored in one location and persist across runs. Note: we can't use `/binaryninja` as our home, because upgrades will delete its contents!
- Executes Binary Ninja GUI from xterm though a helper script (`run.sh`) so you can restart the GUI to apply updates

## Usage

`binja.sh` builds and runs the container. You should pass the path of your local Binary Ninja installation directory:

`$ ./binja.sh ../binaryninja/`

You'll probably want to share your project directories, so any subsequent arguments passed to the script are passed to `docker run`:

`$ ./binja.sh ../binaryninja/ --volume /path/to/my/project:/work`

## But Why?!

Binary Ninja no longer supports older glibc versions so we need a fresh userspace e.g. on Debian oldstable. 

### Why not Docker Compose?

Docker compose _also_ went through a breaking update lately, so I don't want to rely on that just yet.

## Bugs and Security

Neither do I guarantee nor regret anything. If you smell something fishy, user the Issue tracker plz!

