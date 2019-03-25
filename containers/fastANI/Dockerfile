FROM ubuntu:18.04

MAINTAINER Shinya Suzuki <sshinya@bio.titech.ac.jp>
LABEL DESCRIPTION "Container for fastANI"

ENV TOOL_DIR /opt
# Set timezone to install R without checking the location
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y git make gcc zlib1g-dev libboost-all-dev autoconf

# Set repository of R
RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get install -y r-base
RUN Rscript -e "install.packages('genoPlotR')"

# Install fastANI with boost
WORKDIR ${TOOL_DIR}
RUN git clone https://github.com/TaskeHAMANO/FastANI.git
WORKDIR ${TOOL_DIR}/FastANI
RUN ./bootstrap.sh
RUN ./configure --with-boost=/usr/lib/x86_64-linux-gnu
RUN make
RUN make install

CMD ["fastANI", "--help"]
