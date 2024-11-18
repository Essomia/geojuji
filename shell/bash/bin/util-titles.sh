#!/bin/bash

source util-colors.sh
source util-titles.sh

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
    echo -e "${YELLOW_BG}$2 $1$(printf "%-$((49 - ${#1}))s" " ")${RESET}";
    echo -e "${YELLOW_BG}$(printf "%-$((50))s" " ")${RESET}";
    echo "";
}

# Usage: styleSubtitle <message>
function styleSubtitle() {
    echo "";
    echo -e "${YELLOW_BG}$2 $1$(printf "%-$((49 - ${#1}))s" " ")${RESET}";
    echo "";
}

# Usage: styleError <message>
function styleError() {
    echo -e "${RED_UL}ERROR:${RESET} ${RED} $1 ${RESET}";
}


# COMMANDS
# --------------------------------

# Usage: fnPrintAndDoCmd <command>
function cmdPrintAndDo() {
    echo "";
    echo -e "${BLUE_BG}RUNNING > ${BLUE} $@ ${RESET}";
    echo "";

    "$@"
}

function cmdPrintOnly() {
    echo "";
    echo -e "${BLUE_BG}YOU NEED TO RUN > ${BLUE} $@ ${RESET}";
    echo "";
}
