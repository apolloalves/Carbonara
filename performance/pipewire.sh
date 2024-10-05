
echo "checar os drivers de áudio no Arch Linux"
lspci -v | grep -A7 -i audio

echo
echo "Verifique o estado dos dispositivos de som com - aplay -l"
aplay -l
echo


echo "Checar o estado do PipeWire"
echo

systemctl --user status pipewire.service
systemctl --user status pipewire-pulse.service
systemctl --user status wireplumber.service


echo 

echo "Verificar os módulos do kernel carregados"
echo
lsmod | grep snd

echo 
echo "Checar o PipeWire pactl"
pactl list short sinks


echo 
echo "Teste de som com speaker-test:"
speaker-test -c 2 -l 1


echo "Logs do sistema para depuração"
journalctl -xe | grep -i audio

echo "Ativar todos os serviços do PipeWire"
systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now wireplumber.service

echo "Verificar o status de todos os serviços"

systemctl --user status pipewire.service
systemctl --user status pipewire-pulse.service
systemctl --user status wireplumber.service

echo "Reiniciando serviços do pipewire"
systemctl --user restart pipewire.service pipewire-pulse.service wireplumber.service

echo "Pipewire test completed!"

