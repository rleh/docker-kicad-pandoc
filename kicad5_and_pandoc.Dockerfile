FROM setsoft/kicad_auto:latest

RUN apt-get -qq --allow-releaseinfo-change update && apt-get -qq upgrade && apt-get -qq -y install git zip pandoc texlive-latex-base texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra texlive-fonts-extra texlive-xetex

LABEL org.opencontainers.image.source https://github.com/rleh/docker-kicad-pandoc
