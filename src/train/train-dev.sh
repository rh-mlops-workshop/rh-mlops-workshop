#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. $DIR/config.sh

pip install -U pip setuptools grpcio-tools==1.29.0 seldon-core==1.1.0 
pip install -r /projects/datascience-examples/workshop/src/train/requirements.txt

echo "Running training"
rm -rf $HOME/model
python $DIR/$PYTHON_SCRIPT -m $HOME/model -r $RUN_NAME