#! /bin/bash

sudo cp systemd/xray.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable xray
sudo systemctl start xray
sudo systemctl status xray

gsettings set org.gnome.system.proxy mode manual
gsettings set org.gnome.system.proxy.http port 10809
gsettings set org.gnome.system.proxy.https port 10809
gsettings set org.gnome.system.proxy.socks port 10808
