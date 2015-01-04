# docker-plex
This is [Plex Media Server](https://plex.tv/) in a docker container.

The easiest way to use this container is probably a fig file:
```
plex:
  image: stono/plex 
  volumes:
    - ./storage:/storage
  ports:
    - "32400:32400/tcp"
    - "32400:32400/udp"
```
And then you can start with `fig up -d`, give it a couple of seconds and then you can access it on http://127.0.0.1:32400/web

## Storage/Backup
Plex has been configured to use /storage/plex for its configuration, this will be owned by the "docker" user and "docker" group, (uid, gid both 1250).  If you mount the directory in as I have done in the fig file, /storage will be created.  You only ever need to back this directory up, and to restore plex to a fully working state - you simply download this docker container somewhere else, and add the storage directory.

## A note on file permissions and ownership
The account plex runs under (docker:docker) needs read/write to the configuration directory.  If you're mounting in a directory created by another installation of plex - the container will do "chown -R 1250:1250 /storage/plex" at first boot.

1250:1250 is the user account and group id I use for each of the other containers I've made (couchpotato, nzbget, sonarr), so that all applications can share the same volume/mount and read/write eachothers files.
