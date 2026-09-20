sudo pacman -Syu \
ansible \
go      \
cargo   \
7z      \
amdgpu_top\
mesa       \
mesa-utils \
vim        \
base       \
base-devel \ 
git        \
python     \
wine       \
qemu-full virt-manager virt-viewer libvirt bridge-utils dnsmasq ebtables iptables-nft \
radare2 \ 
rsync   \
rclone; 

echo 'Changing shell to zsh...';
chsh -s "$(which zsh)";

echo 'Installing GEF (GDB enhanced features)...'

bash -c "$(curl -fsSL https://gef.blah.cat/sh)";

koko