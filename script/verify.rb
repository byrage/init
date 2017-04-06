#!/usr/bin/env ruby
class Verify

  @log = 'verify.log'

  def self.verify_installation(package, command=package)
    puts `echo '\n'"#{package.upcase}" | tee -a "#{@log}"`
    puts `type "#{command}" | tee -a "#{@log}"`
  end

  # curl
  verify_installation 'curl'

  # git
  verify_installation 'git'

  # java 8
  verify_installation 'java'

  # maven
  verify_installation 'mvn'
  
  # gradle
  verify_installation 'gradle'

  # atom editor
  verify_installation 'atom'

  # terminator
  verify_installation 'terminator'

  # english dictionary
  verify_installation 'dict'

  # docker
  verify_installation 'docker'

  # nodejs, npm
  verify_installation 'npm'

  # virtual box
  verify_installation 'virtualbox'

  # chrome
  verify_installation 'chrome', 'google-chrome-stable'

  # tree
  verify_installation 'tree'

  # vim
  verify_installation 'vim'

  # wps office
  verify_installation 'wps office', 'wps'

  # double commander
  verify_installation 'double commander', 'doublecmd'

  # redis
  verify_installation 'redis', 'redis-server'

  # mysql
  verify_installation 'mysql'

  # mysql workbench
  verify_installation 'mysql-workbench'

  # gitkraken
  verify_installation 'gitkraken'

  # franz
  verify_installation 'franz'

  # screencloud
  verify_installation 'screencloud'

  # clementine
  verify_installation 'clementine'

  # diffuse
  verify_installation 'diffuse'

  # Korean input method
  puts `echo '\nUIM' | tee -a "#{@log}"`
  puts `dpkg -l | grep uim | tee -a "#{@log}"`

end
