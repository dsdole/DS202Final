FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install apt-utils -y
RUN apt-get install gpg-agent build-essential wget -y
RUN apt-get install --no-install-recommends software-properties-common dirmngr  -y

RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" -y
RUN apt-get install --no-install-recommends r-base -y

RUN add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y
RUN apt-get install --no-install-recommends r-cran-tidyverse -y
RUN TZ="America/Chicago"