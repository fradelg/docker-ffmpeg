# Docker image for FFMPEG

FFMPEG with x264 enabled. Available at [Docker Hub](https://hub.docker.com/r/fradelg/ffmpeg)

* 3.1: FFmpeg 3.1
* rpi-3.1:: FFmpeg 3.1 for the Raspberry Pi (arvhf) based on Raspbian jessie

## Building

You can build the image by cloning this repo and executing:

```
docker build -t <your_username>/ffmpeg .
```

## Running

```
docker run -it --privileged --device /dev/video0:/dev/video0 <your_username>/ffmpeg bash
```
