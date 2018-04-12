name = local/myskype:0.1
uid = $(shell id -u $(USER))
build:
	sudo docker build -t $(name) .
run:
	sudo docker run -ti --rm --shm-size=256m -e DISPLAY=unix$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd  -v /run/dbus/:/run/dbus/:rw -v /run/user/$(uid)/pulse:/run/user/1000/pulse $(name) bash

