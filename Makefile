build:
	docker build -t myskype:0.1 .
run:
	docker run -ti --rm -e DISPLAY=unix$(DISPLAY) -e PULSE_SERVER=unix:/run/user/1000/pulse/native -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd  -v /run/dbus/:/run/dbus/:rw -v /dev/shm:/dev/shm -v /run/user/1000/pulse:/run/user/1000/pulse myskype:0.1 bash

