# mint-setting-script

this script is to help you through [ruby](https://www.ruby-lang.org/en/) while initialisation is in progress.

First of all, you need to install ruby. Just Run `apt install ruby-full`

## initialise

Use `ruby initialise.rb` to run initialisation script.
TODO : describe process setup and verify / change name of initialise.rb

## customize

Use `ruby customize.rb` to run customizing script.

## update settings

#### alias : 
```bash
# TODO : use sed command in ~/.profile 
```

#### dconf-setting 
```bash
dconf dump /org/cinnamon/desktop/keybindings/ > ${PROJECT_DIR}/settings/dconf/dconf-settings.conf
```

#### autostart 
```bash
cp -f ~/.config/autostart/* ${PROJECT_DIR}/settings/startup_applications
```

#### terminator 
```bash
cp -f ~/.config/terminator/config ${PROJECT_DIR}/settings/terminator
```

#### vim
```bash
cp -f ~/.vimrc ${PROJECT_DIR}/settings/vim
```

#### zsh
```bash
cp -f ~/.zshrc ${PROJECT_DIR}/settings/zsh
```

## VERSION

V0.1 [2016/07/26]

1. Add preferred application
2. Add custom aliases
3. Add vim configuration
4. Add mint shortcut
