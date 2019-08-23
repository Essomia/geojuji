#!/bin/bash

###########
# Util titles
###########

function styleTitle() {
    echo "";
    echo -e "${YELLOW_BG}$(printf "%-$((50))s" " ")${RESET}";
    echo -e "${YELLOW_BG} $1$(printf "%-$((49 - ${#1}))s" " ")${RESET}";
    echo -e "${YELLOW_BG}$(printf "%-$((50))s" " ")${RESET}";
    echo "";
}

function styleSubtitle() {
    echo "";
    echo -e "${YELLOW_BG} $1$(printf "%-$((49 - ${#1}))s" " ")${RESET}";
    echo "";
}
