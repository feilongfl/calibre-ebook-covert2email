FROM ubuntu

# Install calibre deps and then nodejs deps
RUN apt-get update \
    && apt-get install -y \
        python \
        wget \
        gcc \
        xz-utils \
        imagemagick \
        xdg-utils \
    && apt-get install -y \
        build-essential \
        curl \
        fish \
        tmux \
    && apt-get install -y \
        git-core \
        ttf-wqy-microhei \
    && apt-get clean

# Install calibre
RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

RUN wget https://github.com/feilongfl/docker-rdp-calibre/raw/master/News.recipe 
RUN wget https://github.com/feilongfl/docker-rdp-calibre/raw/master/News.aws.recipe

ENTRYPOINT["/usr/bin/fish"]

