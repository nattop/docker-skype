build:
	docker build -t myskype:0.1 .
run:
	sudo docker run -ti --rm -e DISPLAY=unix$DISPLAY -e PULSE_SERVER=unix:127.17.0.1:4713  -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd  -v /run/dbus/:/run/dbus/:rw -v /dev/shm:/dev/shm -v ~/.config/skypeforlinux:/home/larry/.config/skypeforlinux  myskype:0.1 bash

