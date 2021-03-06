FROM timstephens24/ubuntu
ARG BUILD_DATE
ARG VERSION
ARG HDHOMERUNSTABLE_RELEASE
LABEL build_version="stephens.cc version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="timstephens24"

#Add needed nvidia environment variables for https://github.com/NVIDIA/nvidia-docker
ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"

RUN \
  echo "**** install runtime packages ****" && \
  apt-get update && \
  apt-get install -y \
    udev \
    jq \
    unrar \
    curl \
    iproute2 \
    wget && \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

RUN \
  echo "**** install hdhomerun ***" && \
  mkdir /opt/hdhomerun && \
  wget -O /opt/hdhomerun/hdhomerun_record_linux http://download.silicondust.com/hdhomerun/hdhomerun_record_linux && \
  chmod +x /opt/hdhomerun/hdhomerun_record_linux && \
  usermod -d /opt/hdhomerun abc

# add local files
COPY root/ /

# ports and volumes
VOLUME /hdhomerun
EXPOSE 65001/udp 65002
