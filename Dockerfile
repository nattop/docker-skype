FROM base/archlinux

RUN pacman -Syu --noconfirm && pacman -S --needed --noconfirm sudo git binutils fakeroot &&\
useradd -m notroot && echo "notroot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
passwd -d notroot 
RUN sudo -u notroot bash -c 'cd ~ && git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git && cd skypeforlinux-stable-bin && makepkg --noconfirm -sri' 
WORKDIR /home/notroot
USER notroot
ENTRYPOINT skypeforlinux
