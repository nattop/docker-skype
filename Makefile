name = myskype:0.1
uid = $(shell id -u $(USER))
build:
	sudo docker build -t $(name) --build-arg uid=$(uid) .
run:
	sudo docker run -ti --rm -e DISPLAY=unix$(DISPLAY) -e PULSE_SERVER=unix:/run/user/$(uid)/pulse/native -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd  -v /run/dbus/:/run/dbus/:rw -v /dev/shm:/dev/shm -v /run/user/$(uid)/pulse:/run/user/$(uid)/pulse $(name) bash

