#!/bin/bash

function do_mount()
{
  echo "Mounting..."
  bindfs --force-user=www-data --force-group=www-data --perms=0775 --create-for-user=www-data --create-for-group=www-data --create-with-perms=0775 /var/www /home/www
}

function do_unmount()
{
  echo "Unmounting..."
  umount -l /home/www
}

function do_remount()
{
  do_unmount
  do_mount
}

function do_install()
{
  apt install bindfs
}

case $1 in
  help)
    echo "Use: mount | unmount | remount | install"
  ;;
  mount)
    do_mount
  ;;
  unmount)
    do_unmount
  ;;
  remount)
    do_remount
  ;;
  install)
    do_install
  ;;
  *)
    do_remount
  ;;
esac
