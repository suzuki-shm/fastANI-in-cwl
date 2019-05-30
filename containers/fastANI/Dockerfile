FROM ubuntu:18.04

LABEL MAINTAINER "Shinya Suzuki <sshinya@bio.titech.ac.jp>"
LABEL DESCRIPTION "Container for fastANI"

ENV TOOL_DIR /opt
# Set timezone to install R without checking the location
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apt-get update -y && \
    apt-get install -y git \
                       make \
                       build-essential \
                       zlib1g-dev \
                       libboost-all-dev \
                       autoconf \
                       r-base && \
    rm -rf /var/lib/apt/lists/*

# Set repository of R
RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
    Rscript -e "install.packages('genoPlotR')"

# Install fastANI with boost
WORKDIR ${TOOL_DIR}
RUN git clone https://github.com/TaskeHAMANO/FastANI.git && \
    cd ${TOOL_DIR}/FastANI && \
    ./bootstrap.sh && \
    ./configure --with-boost=/usr/lib/x86_64-linux-gnu && \
    make && \
    make install && \
    cd ${TOOL_DIR} && \
    rm -rf ${TOOL_DIR}/FastANI

CMD ["fastANI", "--help"]
