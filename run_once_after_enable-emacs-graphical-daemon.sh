#!/bin/sh
set -eu

systemctl --user daemon-reload
systemctl --user reenable emacs.service
if systemctl --user is-active --quiet graphical-session.target; then
    systemctl --user start emacs.service
fi
