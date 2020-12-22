#!/usr/bin/env sh

# Setup everything required for the system to run

# Setup youtube-upload
sudo python3 -m pip install --upgrade google-api-python-client oauth2client progressbar2
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master || exit
sudo python3 setup.py install

# Setup youtube-dl and twitch-dl
cd ../
sudo apt install youtube-dl
wget https://github.com/ihabunek/twitch-dl/releases/download/1.13.1/twitch-dl.1.13.1.pyz

# Make sure files are executable
chmod +x get-recent.py upload.sh download.sh twitch-dl.1.13.0.pyz

# This is where videos will be saved
SCRIPT_PATH=$(cd "$(dirname "$0")" && pwd)
mkdir "$SCRIPT_PATH/../videos/"
