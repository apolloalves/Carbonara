#!/bin/bash
# Check all services of pipewire user section
#
echo
systemctl --user list-unit-files --state=enabled
echo

systemctl --user status custom-pipewire.service
echo

systemctl --user status pipewire.service
echo
systemctl --user status pipewire-pulse.service
echo
systemctl --user status wireplumber.service



