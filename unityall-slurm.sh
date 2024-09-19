#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --cpus-per-task=1	# number of processors per task
#SBATCH -J "unityall-slurm"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o unityall-slurm.%N.%j.out # STDOUT
#SBATCH -e unityall-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHipp as pyh; \
import time; \
import DataProcessingTools as DPT; \
unityall = DPT.objects.processDirs(dirs=None, objtype=pyh.Unity, saveLevel=1); \
unityall.save(); \
print(time.localtime());"

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:442426856022:awsnotify --message "UnityallJobDone"
