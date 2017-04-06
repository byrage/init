require_relative 'package'

class Curl
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'curl'
    @repository = nil
    @install_command = Package.apt_install('curl')
    @verify_name = 'curl'
    super(@package_name, @repository, @install_command, @verify_name)
  end

end

