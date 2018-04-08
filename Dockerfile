FROM base/archlinux
RUN pacman -Syu --noconfirm && \
        pacman -S --noconfirm base-devel && \
        pacman --noconfirm -S alsa-lib gconf gtk2 libsecret libxss libxtst nss pulseaudio git vi xorg-xauth libexif openjpeg noto-fonts ffmpeg
RUN useradd -m -g wheel -s /bin/bash larry && \
        echo larry:larry | chpasswd && \
	echo "larry ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 
        
RUN sudo -u larry bash -c 'cd ~ && git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git && cd skypeforlinux-stable-bin && makepkg --noconfirm -sri' && \
sudo -u larry bash -c 'cd ~ && git clone  https://aur.archlinux.org/skype-desktop-bin.git && cd skype-desktop-bin && makepkg --noconfirm -sri'

USER larry
WORKDIR /home/larry

