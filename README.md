# heritrix-docker

launch it using
```
docker run -d --name heritrix             \
              -p 39012:8443               \
              -v $PWD/heritrix-jobs:/jobs \
              -e ADMIN=jack               \
              -e PASSWORD=pass            \
              hare1039/heritrix:latest
```
