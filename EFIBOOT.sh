efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=/dev/nvme0n1p2 rw initrd=\initramfs-linux.img' --verbose

efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux Quiet" --loader /vmlinuz-linux --unicode 'root=/dev/nvme0n1p2 rw initrd=\initramfs-linux.img quiet splash' --verbose

# efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux Test" --loader /vmlinuz-linux --unicode 'root=/dev/nvme0n1p2 rw initrd=\initramfs-linux.img' --verbose
