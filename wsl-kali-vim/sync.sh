#!/bin/bash

######################################################
# Sync files between local Vim config and backup dir #
######################################################

# Generate full path of backup directory
# Backup directory is the directory where bash script laying
backup_dir="$(realpath "$(dirname -- "$0")")"

# Write your local config files down here
local_paths=(
    "${HOME}/.vimrc"
    "${HOME}/.vim/coc-settings.json"

    # Don't append a / to this dir below
    # rsync will sync the whole dir if no / is append
    # otherwise, it sync all files/dirs under thie dir, 
    # excluding this dir itself
    "${HOME}/.vim/templates" # don't append a /
    "${HOME}/.vim/spell"
)

# Generate backup paths according to local_paths
backup_paths=()
for path in "${local_paths[@]}"; do
    backup_paths+=("${backup_dir}/$(basename -- "${path}")")
done

################################################################################
# Print usage of this script
# Globals:
#     None
# Arguments:
#     None
# Outputs:
#     Usage of this script
# Returns:
#     None
################################################################################
print_usage () {
    cat <<EOF
sync -- sync files between local Vim config and backup dir

Usage: ./sync.sh OPTION

OPTION available:
    -h --help   : print this information
    -l --local  : list local configure file paths
    -b --backup : list backup paths for configure files
    -i --in     : sync local Vim config into backup dir
    -o --out    : sync config from backup dir into local Vim config
EOF
}

################################################################################
# List local paths for configure file
# Globals:
#     local_paths
# Arguments:
#     None
# Outputs:
#     paths of local config files
# Returns:
#     None
################################################################################
list_local () {
    echo "LOCAL PATHS:"
    for path in "${local_paths[@]}"; do
        echo "${path}"
    done
}

################################################################################
# List backup paths for configure files
# Globals:
#     backup_paths
# Arguments:
#     None
# Outputs:
#     paths of backup configure files
# Returns:
#     None
################################################################################
list_backup () {
    echo "BACKUP PATHS:"
    for path in "${backup_paths[@]}"; do
        echo "${path}"
    done
}

################################################################################
# Sync local configure files into backup directory
# Globals:
#     local_paths
#     backup_paths
# Arguments:
#     None
# Outputs:
#     None
# Returns:
#     None
################################################################################
sync_in () {
    rsync -av --delete "${local_paths[@]}" "${backup_dir}"
}

################################################################################
# Sync backup configure files into local Vim environment
# Globals:
#     local_paths
#     backup_paths
# Arguments:
#     None
# Outputs:
#     None
# Returns:
#     None
################################################################################
sync_out () {
    i=0
    while [[ $i -lt ${#local_paths[@]} ]]; do
        echo -n "${backup_paths[$i]} --> "
        dirname "${local_paths[$i]}"
        # if destination is a directory, it result sync into it instead of replace it
        # so use destination's parent directory
        rsync -av "${backup_paths[$i]}" "$(dirname "${local_paths[$i]}")"
        echo ""
        ((i++))
    done
}

# Parameters processing
# if no options given, print help info and exit
[[ $# -eq 0 ]] && { print_usage; exit 0; };
case "$1" in
    -h|--help)      print_usage; exit 0; ;;
    -l|--local)     list_local;  exit 0; ;;
    -b|--backup)    list_backup; exit 0; ;;
    -i|--in)        sync_in;     exit 0; ;;
    -o|--out)       sync_out;    exit 0; ;;
esac
