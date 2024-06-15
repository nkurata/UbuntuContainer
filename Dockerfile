FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y gcc g++ valgrind zsh curl git netcat-openbsd make && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN chsh -s /bin/zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ENV ZSH_CUSTOM=/root/.oh-my-zsh/custom

RUN curl -o $ZSH_CUSTOM/themes/minimal-os.zsh-theme https://raw.githubusercontent.com/nkurata/zsh-theme/main/minimal-os.zsh-theme

RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="minimal-os"/g' /root/.zshrc

WORKDIR /home

CMD ["/bin/zsh"]
