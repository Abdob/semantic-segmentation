#!/bin/bash
xhost +
nvidia-docker run -it --rm \
	--privileged=true \
	--ipc=host \
	--net=host \
	--volume=/tmp/.X11-unix:/tmp/.X11-unix \
	--volume=$XAUTHORITY:$XAUTHORITY \
	--env=NVIDIA_DRIVER_CAPABILITIES=all \
	--env=DISPLAY=$DISPLAY \
	-e CUDA_DEVICE_MAX_CONNECTIONS=8 \
	--volume=$HOME/limo_data:/limo_data \
	--volume=$(pwd):/semantic-segmentation \
	semantic-segmentation

