#!/bin/bash

source utils-ui.sh

###########
# Utils Functions
###########

# Printing and executing commands
# --------------------------------

# Usage: cmdPrintAndDo <command>
function cmdPrintAndDo() {
    echo -e "${BLUE_BG}RUNNING >${BLUE} $@${RESET}"
    echo ""

    "$@"
}

# Usage: cmdPrintOnly <command>
function cmdPrintOnly() {
    echo -e "${BLUE_BG}TO RUN >${BLUE} $@${RESET}"
    echo ""
}


# Checks
# --------------------------------

# Usage: doFolderExist <directory>
function doFolderExist() {
    if [ ! -d "$1" ]; then
        styleError "Folder '$1' not found"
        exit 1
    fi
}

# Usage: doFileExist <file>
function doFileExist() {
    if [ ! -f "$1" ]; then
        styleError "File '$1' not found"
        exit 1
    fi
}

# Usage: isUnderSitesFolder
function isUnderSitesFolder() {
    # Check if the current folder is under /Sites.
    if [[ ! $(PWD) == *"/Sites"* ]]; then
        styleError "You are not under /Sites folder."
        exit 1
    fi
}

# Usage: isInGitProject
function isInGitProject() {
    if [[ ! -d ".git" ]]; then
        styleError "You are not in a Git project.";
        exit 1;
    fi
}

# Usage: haveCommandExec <command>
function haveCommandExec() {
    if ! command -v "$1" >/dev/null 2>&1; then
        styleError "Command '$1' not found. Please install it first."
        exit 1
    fi
}
