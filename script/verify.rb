#!/usr/bin/env ruby
class Verify

  @log = 'verify.log'

  def self.verifyInstallation(package, command=package)
    puts `echo '\n'"#{package.upcase}" | tee -a "#{@log}"`
    puts `type "#{command}" | tee -a "#{@log}"`
  end

  # curl
  verifyInstallation 'curl'

  # git
  verifyInstallation 'git'

  # java 8
  verifyInstallation 'java'

  # maven
  verifyInstallation 'mvn'
  
  # gradle
  verifyInstallation 'gradle'

  # atom editor
  verifyInstallation 'atom'

  # terminator
  verifyInstallation 'terminator'

  # english dictionary
  verifyInstallation 'dict'

  # docker
  verifyInstallation 'docker'

  # nodejs, npm
  verifyInstallation 'npm'

  # virtual box
  verifyInstallation 'virtualbox'

  # chrome
  verifyInstallation 'chrome', 'google-chrome-stable'

  # tree
  verifyInstallation 'tree'

  # vim
  verifyInstallation 'vim'

  # wps office
  verifyInstallation 'wps office', 'wps'

  # double commander
  verifyInstallation 'double commander', 'doublecmd'

  # redis
  verifyInstallation 'redis', 'redis-server'

  # mysql
  verifyInstallation 'mysql'

  # mysql workbench
  verifyInstallation 'mysql-workbench'

  # gitkraken
  verifyInstallation 'gitkraken'

  # franz
  verifyInstallation 'franz'

  # screencloud
  verifyInstallation 'screencloud'

  # Korean input method
  puts `echo '\nUIM' | tee -a "#{@log}"`
  puts `dpkg -l | grep uim | tee -a "#{@log}"`

end
