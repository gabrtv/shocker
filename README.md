# Shocker / Docker Breakout PoC

This is a Docker Image used to test container breakout exploit first posted here:
http://stealth.openwall.net/xSports/shocker.c

The container will attempt to find and print contents of the Docker host's /etc/shadow.

## Usage

To run the PoC exploit use:

    docker run gabrtv/shocker

## Building

To modify source and rebuild, use:

    docker build -t gabrtv/shocker .

## License

BSD
