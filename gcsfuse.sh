export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

apt-get update
apt-get install gcsfuse

mkdir /mnt/gcs
export GOOGLE_APPLICATION_CREDENTIALS=/mnt/gcs.json
gcsfuse --file-mode=777 --dir-mode=777 prod-01 /mnt/gcs
