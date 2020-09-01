FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && apt-get update && apt-get install -y texlive-base texlive-publishers texlive-bibtex-extra texlive-lang-german texlive-fonts-extra texlive-science lyx make
RUN apt-get upgrade -y
RUN lyx -batch /usr/share/lyx/doc/LaTeXConfig.lyx
RUN mkdir /home/content
RUN apt-get install latex2html -y 
CMD lyx --force-overwrite --export xetex /home/content/solucionario.lyx; latex2html /home/content/solucionario.tex \
&& lyx --force-overwrite --export xetex /home/content/inferencia-clasica.lyx; latex2html /home/content/inferencia-clasica.tex \
&& lyx --force-overwrite --export xetex /home/content/inferencia-bayesiana.lyx; latex2html /home/content/inferencia-bayesiana.tex

# docker build . -t lyx2web
# docker run -v ${PWD}/doc:/home/content -t lyx2web:latest; git add . ; git commit -a -m "just update"
# docker run -v ${PWD}/content:/home/content --rm -it  lyx2web:latest
# lyx --force-overwrite --export pdflatex /home/content/test.lyx
# latex2html /home/content/test.tex
# lyx --force-overwrite --export latex content/test.lyx