require_relative 'package'

class Uim
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'uim'
    @repository = nil
    @install_command = Package.apt_install('uim')
    @verify_name = 'uim'
    super(@package_name, @repository, @install_command, @verify_name)
  end

end

