#!/bin/bash

###########
# Utils UI
###########

# Colors for terminal output
# @url: https://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
# --------------------------------

RESET="\033[0m"

PCOLOR="\033[0;"
PBG="\033[7;"
PUL="\033[4;"

BLUE="${PCOLOR}36m"
BLUE_BG="${PBG}36m"
BLUE_UL="${PUL}36m"

YELLOW="${PCOLOR}33m"
YELLOW_BG="${PBG}33m"
YELLOW_UL="${PUL}33m"

GREEN="${PCOLOR}32m"
GREEN_BG="${PBG}32m"
GREEN_UL="${PUL}32m"

RED="${PCOLOR}31m"
RED_BG="${PBG}31m"
RED_UL="${PUL}31m"

PINK="${PCOLOR}35m"
PINK_BG="${PBG}35m"
PINK_UL="${PUL}35m"


# Messages
# --------------------------------

# Usage: styleError <message>
function styleError() {
    echo -e "${RED_UL}ERROR:${RESET} ${RED} $@${RESET}"
}

# Usage: styleWarn <message>
function styleWarn() {
    echo -e "${YELLOW_UL}WARNING:${RESET} ${YELLOW} $@${RESET}"
}

# Usage: styleInfo <message>
function styleInfo() {
    echo -e "${BLUE_UL}INFO:${RESET} ${BLUE} $@${RESET}"
}

# Usage: styleSuccess <message>
function styleSuccess() {
    echo -e "${GREEN_UL}SUCCESS:${RESET} ${GREEN} $@${RESET}"
}


# Titles for section
# --------------------------------

# Usage: styleTitle <message>
function styleTitle() {
    echo ""
    echo -e "${YELLOW_BG}$(printf "%-$((50))s" " ")${RESET}"
    echo -e "${YELLOW_BG} $1 $(printf "%-$((48 - ${#1}))s" " ")${RESET}"
    echo -e "${YELLOW_BG}$(printf "%-$((50))s" " ")${RESET}"
    echo ""
}

# Usage: styleSubtitle <message>
function styleSubtitle() {
    echo ""
    echo -e "${YELLOW_BG} $1 $(printf "%-$((48 - ${#1}))s" " ")${RESET}"
    echo ""
}
