build:
	docker build -t myskype:0.1 .
run:
	sudo docker run -ti --rm -e DISPLAY=unix$DISPLAY -e PULSE_SERVER="tcp:172.17.0.1:4713" -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd --privileged myskype:0.1 bash

