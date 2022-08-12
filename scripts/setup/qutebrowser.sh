#!/usr/bin/env bash

git_dir=$HOME/git
config_dir=$HOME/.config/qutebrowser
themes_dir=$config_dir/themes

INSTALL_PATH=$HOME/.local/share/qutebrowser/userscripts
FILE=translate

if [ "$(lsb_release -s -i)" = "Fedora" ]; then
  sudo dnf install qutebrowser
elif [ "$(lsb_release -s -i)" = "" ]; then
  echo 1
fi
  

cd $git_dir
if [ ! -d $git_dir/nord-qutebrowser ]; then
  git clone https://github.com/Linuus/nord-qutebrowser
else
  cd $git_dir/nord-qutebrowser && git pull
fi

mkdir -p $themes_dir
ln -sf $git_dir/nord-qutebrowser/nord-qutebrowser.py $themes_dir

cd $git_dir
if [ ! -d $git_dir/Qute-Translate ]; then
  git clone https://github.com/AckslD/Qute-Translate
else
  cd $git_dir/Qute-Translate && git pulls
fi

mkdir -p $INSTALL_PATH
ln -sf $git_dir/Qute-Translate/$FILE $INSTALL_PATH
