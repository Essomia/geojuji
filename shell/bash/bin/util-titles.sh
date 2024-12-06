#!/bin/bash

source util-colors.sh

###########
# Utils bashscript
###########

# MESSAGES
# --------------------------------

# Usage: styleTitle <message>
function styleTitle() {
    echo -e

    echo "";
    echo -e "${YELLOW_BG}$(printf "%-$((50))s" " ")${RESET}";
    echo -e "${YELLOW_BG} $1 $(printf "%-$((48 - ${#1}))s" " ")${RESET}";
    echo -e "${YELLOW_BG}$(printf "%-$((50))s" " ")${RESET}";
    echo "";
}

# Usage: styleSubtitle <message>
function styleSubtitle() {
    echo "";
    echo -e "${YELLOW_BG} $1 $(printf "%-$((48 - ${#1}))s" " ")${RESET}";
    echo "";
}

# Usage: styleError <message>
function styleError() {
    echo -e "${RED_UL}ERROR:${RESET} ${RED} $@${RESET}";
}

# Usage: styleInfo <message>
function styleInfo() {
    echo -e "${BLUE_UL}INFO:${RESET} $@";
}


# COMMANDS
# --------------------------------

# Usage: fnPrintAndDoCmd <command>
function cmdPrintAndDo() {
    echo "";
    echo -e "${BLUE_BG}RUNNING >${BLUE} $@${RESET}";
    echo "";

    "$@"
}

function cmdPrintOnly() {
    echo "";
    echo -e "${BLUE_BG}TO RUN >${BLUE} $@${RESET}";
    echo "";
}
