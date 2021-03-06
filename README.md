sonarr
======

The sonarr image runs [Sonarr](https://sonarr.tv/) on top of the
[jleight/phusion-mono](https://registry.hub.docker.com/u/jleight/phusion-mono/)
container.


Usage
-----

A Sonarr container can be started with very little extra configuration. Here's
a simple example that starts the container and opens port 8989:

```bash
$ docker run \
  --name sonarr \
  -p 8989:8989 \
  jleight/sonarr
```

If you want to change the sonarr base URL (which defaults to `/`), you can
specify a `SONARR_URLBASE` environment variable and sonarr will be configured to
use the specified base URL. For example, to use a base URL of `/sonarr`:

```bash
$ docker run \
  --name sonarr \
  -p 8989:8989 \
  -e SONARR_URLBASE=/sonarr \
  jleight/sonarr
```
