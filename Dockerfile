FROM node:18-bookworm

WORKDIR /code/app

RUN apt update && apt upgrade -y
RUN apt install -y openssh-server

# Environment configure
RUN apt install -y curl wget zsh git vim tmux htop btop
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s $(which zsh)

# Configure SSH
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]