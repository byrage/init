#!/usr/bin/env ruby
class Customize

  require 'fileutils'

  def self.makeDirectoryIfNotExists(directory)
    FileUtils.mkdir_p(directory) unless File.exists?(directory)
    # Same meaning with above line
    # puts `mkdir -p "#{directory}"`
  end

  def self.copy(src, dst)
    makeDirectoryIfNotExists(dst)
    FileUtils.cp_r(src, dst)
  end

  def self.catAndAppend(src, dst, fileName)
    makeDirectoryIfNotExists(dst)
    puts `cat #{src} >> #{dst+fileName}`
  end

  def self.tryingMessage(command)
    puts `echo '\nInstalling #{command} ... \n\n\n'`
  end

  print 'input your id : '
  userId = gets.chomp
  homeDirectory = '/home/'+userId
  absolutePath = Dir.pwd
  myFile =absolutePath.split('/script')[0] + '/customize/'

  puts 'homeDirectory = '+homeDirectory
  puts 'myFile = '+myFile


  # set preferred application
  tryingMessage 'set preferred application'
  autoStart = [myFile + 'startup_applications/.', homeDirectory+'/.config/autostart']
  copy autoStart[0], autoStart[1]
  puts `chown -R "#{userId}":"#{userId}" "#{autoStart[1]}"`

  # set custom aliases
  tryingMessage 'set custom aliases'
  aliases = [myFile + 'alias/*', homeDirectory, '/.profile'] # .profile
  catAndAppend aliases[0], aliases[1], aliases[2]

  # set vim configuration
  tryingMessage 'set vim configuration'
  vim = [myFile + '/vim/vimrc', homeDirectory, '/.vimrc'] # .vimrc
  catAndAppend vim[0], vim[1], vim[2]

  # set mint shortcut
  tryingMessage 'set mint shortcut'
  dconf = myFile + '/dconf/dconf-settings.conf'
  puts `apt-get -f install`
  puts `apt install dconf-cli`
  puts `dconf load /org/cinnamon/desktop/keybindings/ < "#{dconf}"`

  # set git alias
  tryingMessage 'set git alias'
  puts `git config --global alias.co 'checkout'`
  puts `git config --global alias.br 'branch -v'`
  puts `git config --global alias.ci 'commit'`
  puts `git config --global alias.st 'status'`
  puts `git config --global alias.amend 'commit --amend'`
  puts `git config --global alias.unstage 'reset HEAD --'`
  puts `git config --global alias.last 'log -1 HEAD'`

  # set terminator configuration
  tryingMessage 'set terminator configuration'
  terminator = [myFile + '/terminator/config', homeDirectory+'/.config/terminator']
  copy terminator[0], terminator[1]

end
