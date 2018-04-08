FROM base/archlinux
RUN pacman -Syu --noconfirm && \
	pacman -S --noconfirm --needed sudo git binutils fakeroot && \
	pacman -S --noconfirm noto-fonts libexif openjpeg ffmpeg
RUN useradd -m -s /bin/bash larry && \
        echo larry:larry | chpasswd && \
	echo "larry ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 
RUN sudo -u larry bash -c 'cd ~ && git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git && cd skypeforlinux-stable-bin && makepkg --noconfirm -sri' && \
	usermod -G audio larry
RUN echo 'export PULSE_SERVER="tcp:localhost:64713"' >> /usr/local/bin/skype-pulseaudio
USER larry
WORKDIR /home/larry

