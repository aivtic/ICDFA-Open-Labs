FROM ubuntu:22.04

LABEL maintainer="ICDFA <contact@icdfa.com>"
LABEL description="Nmap Basics Lab - ICDFA Open Labs"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /lab

RUN apt-get update && apt-get install -y \
    nmap \
    python3 \
    python3-pip \
    curl \
    wget \
    vim \
    nano \
    && rm -rf /var/lib/apt/lists/*

COPY . /lab/

RUN chmod +x *.sh

RUN useradd -m -s /bin/bash student && \
    chown -R student:student /lab

USER student

CMD ["/bin/bash"]
