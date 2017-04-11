require_relative 'package'

class Terminator
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'terminator'
    @repository = nil
    @install_command = apt_install(@package_name)
    @verify_name = @package_name
  end

end

