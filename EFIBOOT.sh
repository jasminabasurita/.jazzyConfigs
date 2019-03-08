efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=/dev/nvme0n1p2 rw initrd=/intel-ucode.img initrd=/acpi_override initrd=/initramfs-linux.img mem_sleep_default=deep' --verbose

efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux Quiet" --loader /vmlinuz-linux --unicode 'root=/dev/nvme0n1p2 rw initrd=/intel-ucode.img initrd=/acpi_override initrd=/initramfs-linux.img mem_sleep_default=deep quiet splash' --verbose

# efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux Test" --loader /vmlinuz-linux --unicode 'root=/dev/nvme0n1p2 rw initrd=/intel-ucode.img initrd=/acpi_override initrd=/initramfs-linux.img mem_sleep_default=deep' --verbose
