#!/bin/bash

SAVE_DIR=/limo_data/dataset/semantics
KITTI_PATH=/limo_data/dataset/sequences
IMAGE_FOLDER=image_2

mkdir -p $SAVE_DIR

for folder_path in $KITTI_PATH/??
do
	cur_save_dir=$SAVE_DIR/${folder_path: -2}/$IMAGE_FOLDER
	mkdir -p $cur_save_dir
	echo "Writing predictions to $cur_save_dir"
	CUDA_VISIBLE_DEVICES=0 python demo_folder.py --demo-folder $folder_path/$IMAGE_FOLDER --snapshot ./kitti_best.pth --save-dir $cur_save_dir
done
echo "Finished converting kitti dataset."
