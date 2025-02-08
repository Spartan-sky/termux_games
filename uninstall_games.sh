#!/data/data/com.termux/files/usr/bin/bash

# Colors for formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to display colorful banner using figlet and lolcat
display_banner() {
  echo -e "${CYAN}"
  figlet -f slant "$1" | lolcat
  echo -e "${NC}"
}

# List of installed packages
packages=(
  figlet
  ruby
  ncurses-utils
  libandroid-support
  libc++
  glib
  libcurl
  libedit
  0verkill
  frogcomposband
  brogue
  cavez-of-phear
  curseofwar
  csol
  dopewars
  gnugo
  gnuski
  greed
  mazter
  moon-buggy
  moria
  nethack
  ninvaders
  npush
  nsnake
  nudoku
  open-adventure
  robotfindskitten
)

# Uninstall game packages with colorful banners
for package in "${packages[@]}"; do
  display_banner "Removing $package"
  pkg uninstall "$package" -y
  echo -e "${GREEN}Uninstalled ${package} successfully!${NC}"
done

# Remove lolcat (installed via gem)
echo -e "${YELLOW}Uninstalling lolcat...${NC}"
gem uninstall lolcat -x -a

# Display success message
echo -e "${GREEN}All packages uninstalled successfully!${NC}"
