require_relative 'package'

class Uim
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'maven'
    @repository = nil
    @install_command = Package.apt_install('mvn')
    @verify_name = 'uim'
  end

end

