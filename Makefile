name = local/myskype:0.1
uid = $(shell id -u $(USER))
build:
	sudo docker build -t $(name) --build-arg uid=$(uid) .
run:
	xhost +local:docker-skype
	sudo docker run -ti 				\
       	--rm 						\
       	--shm-size=256m 				\
	-e DISPLAY=unix$(DISPLAY) 			\
	-v /etc/localtime:/etc/localtime:ro		\
       	-v /tmp/.X11-unix:/tmp/.X11-unix 		\
	-v /run/dbus/:/run/dbus/:rw 			\
	-v /run/user/$(uid)/pulse:/run/user/$(uid)/pulse 	\
	--name docker-skype 				\
	--hostname docker-skype				\
	$(name) bash

