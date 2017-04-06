#!/usr/bin/env ruby
class Customize

  #TODO : 사용자 권한으로 실행하면 copy가 권한문제로 안되고.. root 권한으로 실행하면 git alias가 root로 들어가버림. 현재는 사용자 1번, 루트 1번으로 실행하면 되긴되는데 고쳐야함.

  require 'fileutils'

  def self.make_directory_if_not_exists(directory)
    FileUtils.mkdir_p(directory) unless File.exists?(directory)
    # Same meaning with above line
    # puts `mkdir -p "#{directory}"`
  end

  def self.copy(src, dst)
    make_directory_if_not_exists(dst)
    FileUtils.cp_r(src, dst)
  end

  def self.cat_and_append(src, dst, fileName)
    make_directory_if_not_exists(dst)
    puts `cat #{src} >> #{dst+fileName}`
  end

  def self.print_trying_message(command)
    puts `echo '\nInstalling #{command} ... \n\n\n'`
  end

  user = `echo $USER`.strip
  homeDirectory = `echo $HOME`.strip
  currentPath = Dir.pwd
  settings =currentPath.split('/script')[0] + '/settings/'

  puts 'homeDirectory = '+homeDirectory
  puts 'settings = '+settings


  # set preferred application
  print_trying_message 'set preferred application'
  startupApplications = [settings + 'startup_applications/.', homeDirectory+'/.config/autostart']
  copy startupApplications[0], startupApplications[1]
  puts `chown -R "#{user}":"#{user}" "#{startupApplications[1]}"`

  # set custom aliases
  print_trying_message 'set custom aliases'
  aliases = [settings + 'alias/*', homeDirectory, '/.profile'] # .profile
  cat_and_append aliases[0], aliases[1], aliases[2]

  # set vim configuration
  print_trying_message 'set vim configuration'
  vim = [settings + '/vim/vimrc', homeDirectory, '/.vimrc'] # .vimrc
  cat_and_append vim[0], vim[1], vim[2]

  # set mint shortcut
  print_trying_message 'set mint shortcut'
  dconf = settings + '/dconf/dconf-settings.conf'
  puts `apt-get -f install`
  puts `apt install dconf-cli`
  puts `dconf load /org/cinnamon/desktop/keybindings/ < "#{dconf}"`

  # set git alias
  print_trying_message 'set git alias'
  puts `git config --global alias.co 'checkout'`
  puts `git config --global alias.br 'branch -v'`
  puts `git config --global alias.ci 'commit'`
  puts `git config --global alias.st 'status'`
  puts `git config --global alias.amend 'commit --amend'`
  puts `git config --global alias.unstage 'reset HEAD --'`
  puts `git config --global alias.last 'log -1 HEAD'`

  # set terminator configuration
  print_trying_message 'set terminator configuration'
  terminator = [settings + '/terminator/config', homeDirectory+'/.config/terminator']
  copy terminator[0], terminator[1]

end
