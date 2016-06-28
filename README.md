# Wires

### Setup


```bash
$ docker build -t wires:latest .
```

First, elect a directory that will hold all HTML sites. This will be mounted as `/var/www/html` into the container i.e. `./sites`.

Second, elect a data directory which will be mounted as `/opt/wireframes` and hold the `nginx` configuration files for the sites.

Also, you must have a `WIRE_DOMAIN` which resolves to the Docker host i.e. `wires.activelamp.com`

### Example usage

We want to serve the `v0.10` tag of `git@github.com:client/project.git` as `http://project-v0-10.wires.activelamp.com`:

1. Clone repo to a directory under the `./sites` directory.

    ```bash
    $ git clone git@github.com:client/project.git --branch v0.10 --depth=5 ./sites/c109ed
    ```

1. Register the sub-domain => directory mapping via the `add-site` command:

    ```bash
    $ docker run -e WIRE_DOMAIN=wires.activelamp.com \
        -v ./wireframes:/opt/wireframes \
        wires:latest \
        add-site project-v0-10 c109ed
    ```

    This command will create the `nginx` configuration files under `./wireframes`

1. Start/restart service mounting our sites directory and the configuration directory:

    ```bash
    $ docker run -e WIRE_DOMAIN=wires.activelamp.com \
        -v ./wireframes:/opt/wireframes \
        -v ./sites:/var/www/html \
        -d
        wires:latest
    ```

1. Register sub-domain to Route 53

    To be implemented. Will use `awscli`.

## Todos:

* [ ] Create a separate service to run on foreground so we can run it and have the freedom of reloading the `nginx` configurations every time we call `add-site`.
