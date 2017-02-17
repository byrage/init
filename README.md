# mint-setting-script

this script is to help you through ruby while initialisation is in progress.
First of all, you must run "apt install ruby-full" command.

## initialise

Use "ruby initialise.rb" to run initialisation script.

## customize

Use "ruby customize.rb" to run customizing script.

## update settings

alias
TODO : use sed command in ~/.profile 

dconf-setting 
dconf dump /org/cinnamon/desktop/keybindings/ > ${PROJECT}/settings/dconf/dconf-settings.conf

autostart 
cp -f ~/.config/autostart/* ${PROJECT}/settings/start ${PROJECT}/settings/startup_applications

terminator 
cp -f ~/.config/terminator/config ${PROJECT}/settings/terminator

vim
cp -f ~/.vimrc ${PROJECT}/settings/vim

zsh
cp -f ~/.zshrc ${PROJECT}/settings/zsh

##VERSION

V0.1 [2016/07/26]

1. Add preferred application
2. Add custom aliases
3. Add vim configuration
4. Add mint shortcut
