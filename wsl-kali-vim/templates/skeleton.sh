#!/usr/bin/bash

# global constants
readonly VERSION="0.1.0" # using semantic versioning
readonly AUTHOR="LSQ"
readonly EMAIL="lsq6815@gmail.com"
readonly HELP_INFO=$(cat <<END
<Description Goes Here>
Usage: ${0##*/} <Usage Goes Here>

Options:
    <Options Goes Here>

Version: $VERSION
Copyright $AUTHOR - $EMAIL
END
)

die() {
    echo "$1"
    exit 1
}

# options pasring
while [[ "$1" =~ ^- && "$1" != "--" ]]; do
    case $1 in
        -v | --version )
            echo "$VERSION"
            exit
            ;;
        -h | --help )
            echo "$HELP_INFO"
            exit
            ;;
        -t | --test )
            Test="Test"
            ;;
        # panic is option is unknown
        * )
            die "Unknown opton $1, exit"
            ;;
    esac
    shift
done
# remove --
[[ "$1" == '--' ]] && shift
