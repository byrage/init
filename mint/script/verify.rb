#!/usr/bin/env ruby
class Initialise

  # Korean input method
  puts `echo 'UIM' >> result`
  puts `dpkg -l | grep uim >> result`

  # basic
  puts `echo 'CURL' >> result`
  puts `type curl &>> result`

  # git
  puts `echo 'GIT' >> result`
  puts `type git &>> result`

  # java 8
  puts `echo 'JAVA' >> result`
  puts `type java &>> result`

  # maven
  puts `echo 'MAVEN' >> result`
  puts `type maven &>> result`

  # gradle
  puts `echo 'GRADLE' >> result`
  puts `type gradle &>> result`

  # atom editor
  puts `add-apt-repository -y ppa : webupd8team/atom && \
        apt-get update && \
        apt-get -y install atom)`

  # terminator
  puts `echo 'TERMINATOR' >> result`
  puts `type terminator &>> result`

  # english dictionary
  puts `echo 'DICT' >> result`
  puts `type dict &>> result`

  # docker
  puts `echo 'DOCKER' >> result`
  puts `type docker &>> result`

  # nodejs, npm
  puts `echo 'npm' >> result`
  puts `type npm &>> result`

  # virtual box
  puts `echo 'VIRTUAL BOX' >> result`
  puts `type virtualbox &>> result`

  # chrome
  puts `echo 'CHROME-BROWSER' >> result`
  puts `type chrome-browser &>> result`

  # tree
  puts `echo 'TREE' >> result`
  puts `type tree &>> result`

  # vim
  puts `echo 'VIM' >> result`
  puts `type vim &>> result`

end