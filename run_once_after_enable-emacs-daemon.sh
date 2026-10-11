#!/bin/sh
set -eu

systemctl --user daemon-reload
systemctl --user enable --now emacs.service
