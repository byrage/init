#!/usr/bin/env ruby
class Initialise

  # Korean input method
  puts `echo 'UIM' >> result`
  puts `dpkg -l | grep uim >> result`

  # basic
  puts `echo 'CURL' >> result`
  puts `type curl 2 &>> result`

  # git
  puts `echo 'GIT' >> result`
  puts `type git 2 &>> result`

  # java 8
  puts `echo 'JAVA' >> result`
  puts `type java 2 &>> result`

  # maven
  puts `echo 'MAVEN' >> result`
  puts `type maven 2 &>> result`

  # gradle
  puts `echo 'GRADLE' >> result`
  puts `type gradle 2 &>> result`

  # atom editor
  puts `add-apt-repository -y ppa : webupd8team/atom && \
        apt-get update && \
        apt-get -y install atom)`

  # terminator
  puts `echo 'TERMINATOR' >> result`
  puts `type terminator 2 &>> result`

  # english dictionary
  puts `echo 'DICT' >> result`
  puts `type dict 2 &>> result`

  # docker
  puts `echo 'DOCKER' >> result`
  puts `type docker 2 &>> result`

  # nodejs, npm
  puts `echo 'npm' >> result`
  puts `type npm 2 &>> result`

  # virtual box
  puts `echo 'VIRTUAL BOX' >> result`
  puts `type virtualbox 2 &>> result`

  # chrome
  puts `echo 'CHROME-BROWSER' >> result`
  puts `type chrome-browser 2 &>> result`

  # tree
  puts `echo 'TREE' >> result`
  puts `type tree 2 &>> result`

  # vim
  puts `echo 'VIM' >> result`
  puts `type vim 2 &>> result`

end