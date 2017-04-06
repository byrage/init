# require 'rubygems'
# require 'active_support/core_ext/string'
# klasses = Dir['../packages/*.rb'].map {|file| File.basename(file, '.rb').camelize.constantize }

Dir['../packages/*.rb'].each {|file| require file}
packages = [Tree.new, Uim.new]

packages.each { |p|
  exec p.install_command
  # system p.install_command
  # puts p.package_name
}