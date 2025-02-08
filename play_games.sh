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
  figlet -f big "$1" | lolcat
  echo -e "${NC}"
}

# Function to display a centered box with credits
display_credits_box() {
  clear
  local cols=$(tput cols)
  local banner_text="Termux Games"

  # Calculate center position
  local banner_padding=$(((cols - ${#banner_text}) / 2))
  local credit_padding=$(((cols - ${#credit_text}) / 2))

  # Display banner
  echo -e "${CYAN}"
  printf "%*s\n" $((banner_padding + ${#banner_text})) "$(display_banner "$banner_text")"
  echo -e "${NC}"

  # Display credits box
  echo -e "${YELLOW}"
  printf "+%*s\n" $((credit_padding + ${#credit_text} + 2)) | tr ' ' '-'
  printf "|%*s|\n" $((credit_padding + ${#credit_text})) "$credit_text"
  printf "+%*s\n" $((credit_padding + ${#credit_text} + 2)) | tr ' ' '-'
  echo -e "${NC}"
}

# List of game packages (excluding pacman4console)
games=(
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

# Function to run the selected game
run_option() {
  local choice=$1
  if [ "$choice" -ge 1 ] && [ "$choice" -le "${#games[@]}" ]; then
    display_banner "${games[$(($choice - 1))]}"
    echo -e "${GREEN}Launching ${games[$(($choice - 1))]}...${NC}"
    sleep 2
    "${games[$(($choice - 1))]}"
  else
    echo -e "${RED}Invalid choice!${NC}"
  fi
}

# Display credits box
display_credits_box

# Display colorful menu with available games
echo -e "${CYAN}==== ${YELLOW}Termux Games Menu${CYAN} ====${NC}"
for ((i = 0; i < ${#games[@]}; i++)); do
  echo -e "${YELLOW}[$(($i + 1))]${NC} ${CYAN}${games[$i]}${NC}"
done

# Prompt user to choose a game
echo -e "${YELLOW}Enter the number of the game you want to play: ${NC}"
read -p "" choice

# Run the selected game
run_option "$choice"
