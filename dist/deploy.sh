cd $GITHUB_WORKSPACE/.
mkdir -p ~/.aws
echo "[sportwig]" > ~/.aws/config
echo "region=${{ env.AWS_DEFAULT_REGION }}" >> ~/.aws/config
echo "[sportwig]" > ~/.aws/credentials
echo "aws_access_key_id=${{ env.AWS_ACCESS_KEY_ID }}" >> ~/.aws/credentials
echo "aws_secret_access_key=${{ env.AWS_SECRET_ACCESS_KEY }}" >> ~/.aws/credentials

python -m pip install virtualenv
virtualenv .venv
source ./.venv/bin/activate

python -m pip install pip -U
python -m pip install -r requirements/deploy.txt

{
  zappa status ${{ github.ref_name }}
  echo "Starting update..."
  zappa update ${{ github.ref_name }}
} || {
  echo "Starting deployment..."
  zappa deploy ${{ github.ref_name }}
}