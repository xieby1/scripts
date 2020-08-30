#!/bin/bash

head_line(){
    figlet_exist=$(type figlet &> /dev/null)
    if [[ ${figlet_exist} -eq 0 ]]; then
        figlet "$1"
    else
        echo "$1"
    fi
}

head_line $1
