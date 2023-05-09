### Cisco AnyConnect Client isolated container.


This allows you to run Cisco AnyConnect client in an isolated docker or podman container
in a way that doesn't allow it to interfere with your local routing, firewall and DNS.

This is especially useful for people that have complex local containerised or virtualised
environments.

Please note that the anyconnect-manager MUST be run with sudo to work correctly.
A HTTP server is used to provide the interface to the AnyConnect client, it defaults
to http://localhost:5900/.

It provides a SOCKS5 proxy on localhost:1080 which you can then tunnel your requests through.

You will need to provide your own copy of the AnyConnect installer script (in the same
directory as the Dockerfile) when you build it.
Build with it with `docker build -t anyconnect-client .`

P.S. It currently does not support running multiple clients at the same time and it
only works with a Linux host.
