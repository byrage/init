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

  print 'input your id : '
  userId = gets.chomp
  homeDirectory = '/home/'+userId
  absolutePath = Dir.pwd
  myFile =absolutePath.split('/script')[0] + '/customize/'

  puts 'homeDirectory = '+homeDirectory
  puts 'myFile = '+myFile

  autoStart = [myFile + 'startup_applications/.', homeDirectory+'/.config/autostart']
  aliases = [myFile + 'alias/*', homeDirectory, '/.profile'] # .profile
  vim = [myFile + '/vim/vimrc', homeDirectory, '/.vimrc'] # .vimrc
  dconf = myFile + '/dconf/dconf-settings.conf'

  # set preferred application
  copy autoStart[0], autoStart[1]
  puts `chown -R "#{userId}":"#{userId}" "#{autoStart[1]}"`

  # set custom aliases
  catAndAppend aliases[0], aliases[1], aliases[2]

  # set vim configuration
  catAndAppend vim[0], vim[1], vim[2]

  # set mint shortcut
  puts `apt install dconf-cli`
  puts `dconf load /org/cinnamon/desktop/keybindings/ < "#{dconf}"`
end
