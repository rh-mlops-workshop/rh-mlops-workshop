#!/bin/bash

# Source code is checked ut at /workspace/source
# Model should be written to /workspace/model

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. $DIR/config.sh

pip uninstall -y dask mlflow 2&>1 > /dev/null

pip install -U pip setuptools
pip install -r $DIR/requirements.txt

echo "Running training"
python $DIR/$PYTHON_SCRIPT -m /workspace/model -r $RUN_NAME