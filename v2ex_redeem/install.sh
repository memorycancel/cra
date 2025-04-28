#! /bin/bash

sudo cp systemd/v2ex_redeem.* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable v2ex_redeem
sudo systemctl status xray
