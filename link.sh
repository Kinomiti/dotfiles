#!/bin/bash
SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR
if [ "$(uname)" == "Darwin" ] ; then
  ln -f ./karabiner/assets/complex_modifications/bundle_hyper_js_for_vim.json ~/.config/karabiner/assets/complex_modifications
fi

if [ ! -e ~/.config/nvim/ ] ; then
  mkdir ~/.config/nvim/
fi
ln -f ./nvim/init.vim ~/.config/nvim/init.vim
