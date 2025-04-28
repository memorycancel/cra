#! /bin/bash

sudo apt install curl
curl https://mise.run | sh
sudo apt-get install build-essential libz-dev libssl-dev libffi-dev libyaml-dev
echo "eval \"\$(/home/memorycancel/.local/bin/mise activate bash)\"" >> ~/.bashrc
mise use -g ruby
