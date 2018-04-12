name = local/myskype:0.1
uid = $(shell id -u $(USER))
build:
	sudo docker build -t $(name) .
run:
	xhost +local:docker-skype
	sudo docker run -ti 				\
       	--rm 						\
       	--shm-size=256m 				\
	--device /dev/snd 				\
	-e DISPLAY=unix$(DISPLAY) 			\
	-v /etc/localtime:/etc/localtime:ro		\
       	-v /tmp/.X11-unix:/tmp/.X11-unix 		\
	-v /run/dbus/:/run/dbus/:rw 			\
	-v /run/user/$(uid)/pulse:/run/user/1000/pulse 	\
	--name docker-skype 				\
	--hostname docker-skype				\
	$(name) bash

