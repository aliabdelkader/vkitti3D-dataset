#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

export INPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset/data"

export OUTPUT_DIR="/home/fusionresearch/Datasets/vkitti3D-dataset"

export OUTPUT_NPY="${OUTPUT_DIR}/output_npy"
export OUTPUT_CSV="${OUTPUT_DIR}/output_csv"

export SEQ1="0001"
export SEQ2="0002"
export SEQ3="0006"
export SEQ4="0018"
export SEQ5="0020"

# Set up the working environment.
CURRENT_DIR=$(pwd)

mkdir -p "${OUTPUT_NPY}"
mkdir -p "${OUTPUT_CSV}"

cd "/home/fusionresearch/Datasets/vkitti3D-dataset/tools" || exit

# sequence 1
python create_npy.py --root_path "${INPUT_DIR}" --out_path "${OUTPUT_NPY}" --sequence "${SEQ1}" --v1 --njobs 4
python convert_npy_to_csv.py --input_path "${OUTPUT_NPY}/${SEQ1}" --channels 7 --output_path "${OUTPUT_CSV}/${SEQ1}" --njobs 4

# sequence 2
python create_npy.py --root_path "${INPUT_DIR}" --out_path "${OUTPUT_NPY}" --sequence "${SEQ1}" --v1 --njobs 4
python convert_npy_to_csv.py --input_path "${OUTPUT_NPY}/${SEQ2}" --channels 7 --output_path "${OUTPUT_CSV}/${SEQ2}" --njobs 4

# sequence 3
python create_npy.py --root_path "${INPUT_DIR}" --out_path "${OUTPUT_NPY}" --sequence "${SEQ3}" --v1 --njobs 4
python convert_npy_to_csv.py --input_path "${OUTPUT_NPY}/${SEQ3}" --channels 7 --output_path "${OUTPUT_CSV}/${SEQ3}" --njobs 4

# sequence 4
python create_npy.py --root_path "${INPUT_DIR}" --out_path "${OUTPUT_NPY}" --sequence "${SEQ4}" --v1 --njobs 4
python convert_npy_to_csv.py --input_path "${OUTPUT_NPY}/${SEQ4}" --channels 7 --output_path "${OUTPUT_CSV}/${SEQ4}" --njobs 4

# sequence 5
python create_npy.py --root_path "${INPUT_DIR}" --out_path "${OUTPUT_NPY}" --sequence "${SEQ5}" --v1 --njobs 4
python convert_npy_to_csv.py --input_path "${OUTPUT_NPY}/${SEQ5}" --channels 7 --output_path "${OUTPUT_CSV}/${SEQ5}" --njobs 4

cd "${CURRENT_DIR}"
