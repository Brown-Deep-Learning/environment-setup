# CSCI 1470 Environment Setup (OSCAR)

This repository contains everything needed to set up the **CSCI 1470** conda environment on Brown University’s OSCAR cluster.

## Table of Contents

1. [Cloning the Repository](#cloning-the-repository)
2. [Creating the Environment](#creating-the-environment)
3. [Verifying the Environment](#verifying-the-environment)
4. [Using the Environment](#using-the-environment)
5. [Troubleshooting](#troubleshooting)

---

## Cloning the Repository

1. Log into OSCAR using your preferred method. Only once you have established a secure connection to your OSCAR instance, proceed to step 2.
2. Clone the repository into your home directory using

```
git clone <REPO_NAME>
```

---

## Creating the Environment

1. Run the environment creation script:

```bash
bash conda_create.sh
```

This script will:

- Remove any existing csci1470 environment.
- Create a new csci1470 environment from env_setup/Other/csci1470.yml.
- Activate csci1470.
- Install a Jupyter kernel named DL-S25 (3.10).

Note: If you need to install the environment in a custom location (e.g., because of storage quotas), you can modify the command in conda_create.sh to use -p /path/to/env_dir instead of -n csci1470.

---

## Verifying the Environment

After the script finishes:

1. Activate the environment:

```bash
conda activate csci1470
```

2. Check installed packages:

```bash
conda list
```

or

```bash
pip freeze
```

You should look for `tensorflow==2.11`, `scikit-learn`, etc. 3. Test a quick import:

```bash
python -c "import tensorflow as tf; print(tf.__version__)"
```

You should see the TensorFlow version (e.g., `2.11.0`).

---

## Using the Environment

### Jupyter Notebooks:

If you want to run Jupyter on a compute node (which is usually recommended for GPU usage), do something like:

```bash
srun --pty -p gpu --mem=16G --gres=gpu:1 jupyter lab --no-browser --port=9999
```

Then, port-forward from your local machine to access the lab interface:

```bash
ssh -L 9999:localhost:9999 your_brown_username@gpu2002.oscar.ccv.brown.edu
```

### Python Scripts

```
conda activate csci1470
python your_script.py
```
