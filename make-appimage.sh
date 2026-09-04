#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q phoenix-x-server-git | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=DUMMY
export DESKTOP=DUMMY
export MAIN_BIN=phoenix
export DEPLOY_OPENGL=1
export ANYLINUX_LIB=1

# Deploy dependencies
quick-sharun /usr/bin/phoenix

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
