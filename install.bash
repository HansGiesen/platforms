#!/bin/bash -e

cleanup()
{
  if [ -d ${MOUNT_DIR} ]
  then
    sudo umount ${MOUNT_DIR} || true
    rmdir ${MOUNT_DIR} || true
  fi
}

if [ $# != 2 ]
then
  echo "Usage: $0 <platform type> <target device>"
  exit 1
fi

PLATFORM=$1
DEVICE=$2

echo "Creating partitions..."

sudo sfdisk ${DEVICE} << EOF
label: dos
unit: sectors
size=2097152, type=b, bootable
type=83
EOF

echo "Creating filesystems..."

sudo partprobe ${DEVICE}

sudo mkfs -t vfat -n BOOT ${DEVICE}1
sudo mkfs -t ext4 -L root ${DEVICE}2

echo "Installing files..."

trap cleanup EXIT

MOUNT_DIR=$(mktemp -d)

sudo mount ${DEVICE}1 ${MOUNT_DIR}
sudo cp platforms/2019.1/${PLATFORM}/sw/linux/boot/BOOT.BIN ${MOUNT_DIR}
sudo cp platforms/2019.1/${PLATFORM}/sw/linux/linux_a53/image/image.ub ${MOUNT_DIR}
sudo umount ${MOUNT_DIR}

sudo mount ${DEVICE}2 ${MOUNT_DIR}
sudo cp -a platforms/2019.1/${PLATFORM}/sw/linux/linux_a53/sysroot/* ${MOUNT_DIR}
sudo umount ${MOUNT_DIR}

rmdir ${MOUNT_DIR}

echo "Done."
