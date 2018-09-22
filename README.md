# Nelson Build Environment

This container holds an pre-built environment that can build the Nelson project. This container is provided as a convenient mechinism for development, and also as a CI environment.

Anything this container does, you can do too - it is simply automation for tedious instalation.

## Building

There are two parts to this build: `container` and `buildkite`. The former is the runtime build container that buildkite will download and install, whilst the latter is a slower-moving base image for the OS that hosts the ephemeral build servers.

To build the container:

```
make container
```

To build the OS image:

```
make buildkite
```
