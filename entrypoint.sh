#!/bin/sh
set -e

cd $GITHUB_WORKSPACE/.
mkdir -p ~/.aws
echo "[sportwig]" > ~/.aws/config
echo "region=$1" >> ~/.aws/config
echo "[sportwig]" > ~/.aws/credentials
echo "aws_access_key_id=$2" >> ~/.aws/credentials
echo "aws_secret_access_key=$3" >> ~/.aws/credentials

virtualenv .venv
source ./.venv/bin/activate

python -m pip install pip -U
python -m pip install -r requirements/deploy.txt

{
  zappa status $4
  echo "Starting update..."
  zappa update $4
} || {
  echo "Starting deployment..."
  zappa deploy $4
}