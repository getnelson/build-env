# Nelson Build Environment

This container holds an pre-built environment that can build the Nelson project. This container is provided as a convenient mechinism for development, and also as a CI environment.

Anything this container does, you can do too - it is simply automation for tedious instalation.

NOTE: the following items are security sensitive and NOT checked into this repo:

1. GPG public and private rings for artifact signing
1. GPG key for aforementioned rings
1. Docker login information for publishing to docker hub
1. SSH keys for updating the nelson repo (tags, releases etc)
1. Buildkite API token
1. Sonatype publishing credentials (codified as a buildkite env hook)
