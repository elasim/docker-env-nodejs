FROM centos

RUN yum install git curl wget vim google-chrome-stable firefox -y
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ADD vimrc /root/.vimrc
RUN vim -esu /root/.vimrc +BundleInstall +qall! || uptime
RUN source /root/.bashrc && \
  nvm install node && \
  npm i -g parcel-bundler typescript ts-node webpack rollup

VOLUME /src
EXPOSE 8080 8443 3000 3001 3002 9876

ENTRYPOINT bash

