#!/bin/bash -e

install -m 644 files/sshd_config		"${ROOTFS_DIR}/etc/ssh/"
install -d "${ROOTFS_DIR}/etc/banner"
install -m 644 files/banner "${ROOTFS_DIR}/etc/banner/ssh"
install -m 644 files/issue.net "${ROOTFS_DIR}/etc/"
on_chroot << EOF
echo "${FIRST_USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/010_${FIRST_USER_NAME}-nopasswd
mkdir -p /home/${FIRST_USER_NAME}/.ssh
EOF

install -m 600 files/authorized_keys "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.ssh"

on_chroot << EOF
chown -R ${FIRST_USER_NAME}:${FIRST_USER_NAME} /home/${FIRST_USER_NAME}/.ssh
EOF