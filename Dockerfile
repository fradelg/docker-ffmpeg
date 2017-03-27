#
# Docker file for FFMPEG 3
#
# BUILD:
# docker build -t fradelg/ffmpeg:3.2.4 .
#
# RUN EXAMPLE: save your webcam stream as a video
# docker run --rm -it --privileged --device /dev/video0:/dev/video0 fradelg/ffmpeg:3.2.4 ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 output.mkv
#

FROM phusion/baseimage
MAINTAINER Francisco Javier Delgado del Hoyo "frandelhoyo@gmail.com"

# Update packages, install dependencies and clean cache
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get -y install curl build-essential nasm libx264-dev libv4l-dev && \
    apt-get -y autoremove && apt-get -y clean

WORKDIR /usr/local/src

# FFMPEG with x264 support
RUN curl -L https://github.com/FFmpeg/FFmpeg/archive/n3.2.4.tar.gz | tar xz && \
    cd FFmpeg-n3.2.4 && \
    ./configure --enable-gpl --enable-shared --enable-libx264 && \
    make && make install && ldconfig && \
    cd .. && rm -rf FFmpeg-n3.2.4

CMD ["/bin/bash"]
