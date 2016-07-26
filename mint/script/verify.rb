#!/usr/bin/env ruby
class Initialise

  #TODO : remove whitespace in standard output

  # Korean input method
  puts `echo '\nUIM' >> result`
  puts `dpkg -l | grep uim >> result`

  # basic
  puts `echo '\nCURL' >> result`
  puts `type curl >> result`

  # git
  puts `echo '\nGIT' >> result`
  puts `type git >> result`

  # java 8
  puts `echo '\nJAVA' >> result`
  puts `type java >> result`

  # maven
  puts `echo '\nMAVEN' >> result`
  puts `type maven >> result`

  # gradle
  puts `echo '\nGRADLE' >> result`
  puts `type gradle >> result`

  # atom editor
  puts `echo '\nATOM' >> result`
  puts `type atom >> result`

  # terminator
  puts `echo '\nTERMINATOR' >> result`
  puts `type terminator >> result`

  # english dictionary
  puts `echo '\nDICT' >> result`
  puts `type dict >> result`

  # docker
  puts `echo '\nDOCKER' >> result`
  puts `type docker >> result`

  # nodejs, npm
  puts `echo '\nnpm' >> result`
  puts `type npm >> result`

  # virtual box
  puts `echo '\nVIRTUAL BOX' >> result`
  puts `type virtualbox >> result`

  # chrome
  puts `echo '\nCHROME-BROWSER' >> result`
  puts `type chrome-browser >> result`

  # tree
  puts `echo '\nTREE' >> result`
  puts `type tree >> result`

  # vim
  puts `echo '\nVIM' >> result`
  puts `type vim >> result`

end