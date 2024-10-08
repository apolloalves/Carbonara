#!/bin/bash
# Check all services of pipewire user section
#
systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service && systemctl --user restart pipewire.service pipewire-pulse.service wireplumber.service
