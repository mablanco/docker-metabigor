# docker-metabigor

Docker image for Metabigor, an Intelligence Framework to do OSINT tasks and more but without any API key (<https://github.com/j3ssie/metabigor>). This is a multistage Docker image that first compiles the Golang source code and then builds an image from scratch that hosts the resulting executable.

## How to use this image

I recommend to always run the Docker container with the `--rm` parameter, which will remove the container after finishing its execution, as Metabigor is a CLI tool that doesn't need to persist anything after running.

This command will run Metabigor with no parameters, thus showing its inline help:

    $ docker run --rm mablanco/metabigor

This command will discover the IPs of a company/organization:

    $ echo "company" | docker run -i --rm mablanco/metabigor net --org

There are more usage examples at <https://github.com/j3ssie/metabigor#example-commands>

## How to build the image

Use the following command to build the image with the `latest` tag and the Metabigor version specified in the Dockerfile:

    $ docker build -t mablanco/metabigor .

In case you want to build a different version, browse the available releases at <https://github.com/j3ssie/metabigor/releases> and then use this command:

    $ docker build --build-arg METABIGOR_VERSION=<version> --build-arg -t mablanco/metabigor:<version> .
