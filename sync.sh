#!/usr/bin/env bash

dest_path=$(dirname "$0")
dest_path=$(realpath "$dest_path")
echo "${dest_path}"

srcs=(
    "${HOME}/.vimrc"
    "${HOME}/.vim/coc-settings.json"
    # Don't append a / to this dir below
    # rsync will sync the whole dir if no / is append
    # otherwise, it sync all files/dirs under thie dir, 
    # excluding this dir itself
    "${HOME}/.vim/templates" # don't append a /
    "${HOME}/.vim/spell"
)

rsync -rv "${srcs[@]}" "${dest_path}"
