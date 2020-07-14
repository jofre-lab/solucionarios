FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && apt-get update && apt-get install -y texlive-base texlive-publishers texlive-bibtex-extra texlive-lang-german texlive-fonts-extra texlive-science lyx make
RUN apt-get upgrade -y
RUN lyx -batch /usr/share/lyx/doc/LaTeXConfig.lyx
RUN mkdir /home/content
RUN apt-get install latex2html -y
CMD lyx --force-overwrite --export pdflatex /home/content/test.lyx; latex2html /home/content/test.tex

# docker build . -t lyx2web
# docker run -v ${PWD}/content:/home/content -t lyx2web:latest
# docker run -v ${PWD}/content:/home/content --rm -it  lyx2web:latest
# lyx --force-overwrite --export pdflatex /home/content/test.lyx
# latex2html /home/content/test.tex