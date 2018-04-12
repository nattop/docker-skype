FROM base/archlinux
ARG uid
RUN pacman -Syu --noconfirm && \
	pacman -S --noconfirm --needed sudo git binutils fakeroot && \
	pacman -S --noconfirm noto-fonts libexif openjpeg ffmpeg alsa-plugins
RUN useradd -u $uid -m -s /bin/bash larry && \
        echo larry:larry | chpasswd && \
	echo "larry ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 
RUN sudo -u larry bash -c 'cd ~ && git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git && cd skypeforlinux-stable-bin && makepkg --noconfirm -sri' 
COPY asound.conf /etc/asound.conf 
RUN chown -R larry:larry /home/larry && \
	cp /etc/asound.conf /home/larry/.asoundrc
ENV PULSE_LATENCY_MSEC=60
USER larry
WORKDIR /home/larry

