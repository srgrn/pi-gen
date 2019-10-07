#!/bin/bash -e

install -m 644 files/sshd_config		"${ROOTFS_DIR}/etc/ssh/"

on_chroot << EOF
echo "${FIRST_USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/010_${FIRST_USER_NAME}-nopasswd

EOF

