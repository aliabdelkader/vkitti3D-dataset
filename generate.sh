#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

export INPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset/data"

export OUTPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset/data"

export SEQ_NUMBER="0001"

# Set up the working environment.
CURRENT_DIR=$(pwd)

cd "/home/fusionresearch/Datasets/vkitti3D-dataset/tools" || exit

python create_npy.py --root_path "${INPUT_DIR}" --out_path "${OUTPUT_DIR}" --sequence "${SEQ_NUMBER}" --v2 --njobs 1

cd "${CURRENT_DIR}"