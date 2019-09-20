#!/bin/bash

export INPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset/data"

export OUTPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset/data"

export SEQ_NUMBER="0001"

cd "/home/fusionresearch/Datasets/vkitti3D-dataset/tools"

python create_npy.py --root_path "${INPUT_DIR}"--out_path "${OUTPUT_DIR}" --sequence "${SEQ_NUMBER}" --v2