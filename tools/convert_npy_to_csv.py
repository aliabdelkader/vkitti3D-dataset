import numpy as np
from tqdm import tqdm
from pathlib import Path
from concurrent.futures import ProcessPoolExecutor
import argparse


def covert_to_csv(infile):

    print(infile.stem)
    point_cloud = np.load(str(infile)).reshape(-1, channels)
    file_name = infile.stem
    outfile = output_path / (file_name + '.csv')
    np.savetxt(outfile, point_cloud, delimiter=",")

    return None


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
                                     description="convert numpy files to csv")

    parser.add_argument('--input_path', type=str, required=True,
                        help='path numpy files')

    parser.add_argument('--channels', type=int, required=True,
                        help='number of channels in npy file')

    parser.add_argument('--output_path', type=str, required=True,
                        help='path for output files')

    parser.add_argument('--njobs', const=4, default=4, type=int,
                        help='number of cores used for processing')

    args = parser.parse_args()

    input_path = Path(args.input_path)
    output_path = Path(args.output_path)
    channels = int(args.channels)
    n_jobs = int(args.njobs)

    files_list = input_path.glob("**/*.npy")

    with ProcessPoolExecutor(max_workers=n_jobs) as pool:
        futures = [pool.submit(covert_to_csv, infile) for infile in files_list]

