# docker-skype

Dockerized version of skype, based on Arch Linux.

To build:
`make`

To start skype:
```
xhost +local:
make start
```
and from inside the container run
`skypeforlinux`
