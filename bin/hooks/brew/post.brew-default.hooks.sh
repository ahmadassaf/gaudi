#!/usr/bin/env bash

echo -e "\n\n🛰   All brew formulas are now installed ..."

echo -e "\nChecking if all brew installed formulas are healthy .. running brew doctor 👨🏻‍⚕️\n"
brew doctor

# Update global git config
git lfs install

if command_exists ghi ; then
    read -p "⚙️  Configuring ghi ... What is your github username ? " GITHUB_USERNAME </dev/tty && ghi config --auth ${GITHUB_USERNAME} </dev/tty  
fi

echo "⚙️  Setting up launchd to start clipper now and restart at login"
brew services start clipper

if command_exists heroku ; then
    echo "⚙️  Configuring Heroku and adding autocompletion..."
    heroku update </dev/tty && heroku autocomplete </dev/tty
    if grep -q "HEROKU_AC_BASH_SETUP_PATH" ~/.bash_profile; then 
        echo "✅  Heroku autocomplete entry already found ...";
    else
        echo "$(heroku autocomplete:script bash)" >> ~/.bash_profile
    fi
fi

# Add the new shell to the list of allowed shells
# We need this to allow the usage of the new bash 4+ version to be the login shell
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash 