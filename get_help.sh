#!/bin/bash

# Check if figlet and lolcat are installed
if ! command -v figlet &> /dev/null || ! command -v lolcat &> /dev/null; then
    echo "Please install 'figlet' and 'lolcat' to run this script."
    exit 1
fi

# Function to display the colorful banner
display_banner() {
    clear
    figlet -f slant "GetHelp" | lolcat
    echo "Welcome to the GetHelp script!" | lolcat
    echo "Choose an option below:" | lolcat
}

website_link="https://www.termuxcommands.com/"
whatsapp_group_link="https://chat.whatsapp.com/CntxW2PbjwT6meNgv7xoLh"
whatsapp_channel_link="https://whatsapp.com/channel/0029Va9BpayHwXbA9dtfo93w"
telegram_channel_link="https://t.me/learn_termux_linux"
youtube_channel_link="https://youtube.com/@TermuxCommands?si=KMGdklzJ2EsJmntb"
facebook_page_link="https://www.facebook.com/profile.php?id=61553455056414&mibextid=ZbWKwL"

display_banner

echo "1. $(echo -e '\e[1;36mOpen Website\e[0m')"
echo "2. $(echo -e '\e[1;36mOpen WhatsApp Group\e[0m')"
echo "3. $(echo -e '\e[1;36mOpen WhatsApp Channel\e[0m')"
echo "4. $(echo -e '\e[1;36mOpen Telegram Channel\e[0m')"
echo "5. $(echo -e '\e[1;36mOpen YouTube Channel\e[0m')"
echo "6. $(echo -e '\e[1;36mOpen Facebook Page\e[0m')"
echo "0. $(echo -e '\e[1;36mExit\e[0m')"

read -p "Enter your choice (0-6): " choice

case $choice in
    1)
        xdg-open "$website_link"
        ;;
    2)
        xdg-open "$whatsapp_group_link"
        ;;
    3)
        xdg-open "$whatsapp_channel_link"
        ;;
    4)
        xdg-open "$telegram_channel_link"
        ;;
    5)
        xdg-open "$youtube_channel_link"
        ;;
    6)
        xdg-open "$facebook_page_link"
        ;;
    0)
        echo "Exiting GetHelp script. Goodbye!" | lolcat
        exit 0
        ;;
    *)
        echo "Invalid choice. Please enter a number between 0 and 6." | lolcat
        ;;
esac
