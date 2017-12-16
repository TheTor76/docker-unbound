# docker-unbound

## Example Usage

```
docker run -d --name unbound \
  -v `pwd`/.private/unbound.conf:/etc/unbound/conf.d/my_unbound.conf:ro \
  -p 53:53 -p 53:53/udp snipzwolf/docker-unbound
```
