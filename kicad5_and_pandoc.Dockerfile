FROM ubuntu:20.04

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=noninteractive

# LaTeX and Pandoc
RUN apt-get -q update && \
    apt-get -y install git zip pandoc texlive-latex-base texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra texlive-fonts-extra texlive-xetex && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /*.deb

# Kicad
RUN	apt-get -y update && \
    apt-get -y install --no-install-recommends software-properties-common make wget curl rar bzip2 librsvg2-bin imagemagick python3-qrcodegen python3-pip git && \
    add-apt-repository --yes ppa:kicad/kicad-5.1-releases && \
    apt-get -y update && \
    apt-get -y install --no-install-recommends libngspice0 kicad kicad-symbols kicad-footprints kicad-packages3d && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /*.deb

# Kicad plugins: KiBot, InteractiveHtmlBom and dependent plugins
RUN curl -s https://api.github.com/repos/INTI-CMNB/KiAuto/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
    curl -s https://api.github.com/repos/INTI-CMNB/KiBoM/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
    curl -s https://api.github.com/repos/INTI-CMNB/InteractiveHtmlBom/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
    curl -s https://api.github.com/repos/INTI-CMNB/PcbDraw/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
    curl -s https://api.github.com/repos/INTI-CMNB/KiCost/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
    curl -s https://api.github.com/repos/INTI-CMNB/KiBot/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
    chmod o+rwx *.deb && \
    apt-get -y update && \
    apt -y install --no-install-recommends ./*.deb && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /*.deb

LABEL org.opencontainers.image.source https://github.com/rleh/docker-kicad-pandoc
