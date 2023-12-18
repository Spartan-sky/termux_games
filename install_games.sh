#!/data/data/com.termux/files/usr/bin/bash

# Colors for formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Install figlet, ruby, lolcat, and ncurses-utils
echo -e "${YELLOW}Installing figlet, ruby, lolcat, and ncurses-utils...${NC}"
pkg install figlet ruby ncurses-utils -y
gem install lolcat

# Function to display colorful banner using figlet and lolcat
display_banner() {
    echo -e "${CYAN}"
    figlet -f slant "$1" | lolcat
    echo -e "${NC}"
}

# Display initial message
echo -e "${YELLOW}$(tput cols | awk '{printf "%*s\n", $1/2 + 20, "Visit termuxcommands.com"}')${NC}"

# List of game packages
games=(
    0verkill
    2048-c
    brogue
    cavez-of-phear
    curseofwar
    csol
    dopewars
    gnugo
    gnuski
    greed
    moon-buggy
    moria
    nethack
    npush
    nsnake
    nudoku
    pacman4console
    robotfindskitten
    tty-solitaire
    myman
)

# Update and upgrade Termux packages
echo -e "${YELLOW}Updating and upgrading Termux packages...${NC}"
pkg update -y && pkg upgrade -y

# Install game packages with colorful banners
for game in "${games[@]}"; do
    display_banner "$game"
    pkg install "$game" -y
    echo -e "${GREEN}Installed ${game} successfully!${NC}"
done

# Display success message with credits
echo -e "${GREEN}All games installed successfully!${NC}"
echo -e "${YELLOW}Visit termuxcommands.com${NC}"
echo -e "${YELLOW}Coded by Achik${NC}"
