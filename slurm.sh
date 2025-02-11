#!/bin/sh
 
#SBATCH --job-name=CXR_LT
#SBATCH --output=logs/SLURM/test.out  # Standard output of the script (Can be absolute or relative path). %A adds the job id to the file name so you can launch the same script multiple times and get different logging files
#SBATCH --error=logs/SLURM/test.err  # Standard error of the script
#SBATCH --time=0-24:00:00  # Limit on the total run time (format: days-hours:minutes:seconds)
#SBATCH --gres=gpu:1  # Number of GPUs if needed
#SBATCH --cpus-per-task=8  # Number of CPUs (Don't use more than 12 per GPU)
#SBATCH --mem=20G  # Memory in GB (Don't use more than 48G per GPU unless you absolutely need it and know what you are doing)
 
 
# activate corresponding environment
#conda deactivate # If you launch your script from a terminal where your environment is already loaded, conda won't activate the environment. This guards against that. Not necessary if you always run this script from a clean terminal
source ~/miniconda3/etc/profile.d/conda.sh
conda activate CXR_LT_Challenge
 
#conda init
# run the program
python src/train.py trainer=gpu
