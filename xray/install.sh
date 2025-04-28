#! /bin/bash

sudo cp systemd/xray.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable xray
sudo systemctl start xray
sudo systemctl status xray
