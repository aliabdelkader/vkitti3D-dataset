#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

export INPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset/data"

export OUTPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset"

export OUTPUT_NPY="${OUTPUT_DIR}/output_npy"
export OUTPUT_CSV="${OUTPUT_DIR}/output_csv"

export SEQ_NUMBER="0001"

# Set up the working environment.
CURRENT_DIR=$(pwd)

mkdir -p "${OUTPUT_NPY}"
mkdir -p "${OUTPUT_CSV}"

cd "/home/fusionresearch/Datasets/vkitti3D-dataset/tools" || exit

#python create_npy.py --root_path "${INPUT_DIR}" --out_path "${OUTPUT_NPY}" --sequence "${SEQ_NUMBER}" --v1 --njobs 4

python convert_npy_to_csv.py --input_path "${OUTPUT_NPY}" --channels 7 --output_path "${OUTPUT_CSV}" --njobs 4

cd "${CURRENT_DIR}"
