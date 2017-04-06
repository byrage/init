require_relative 'package'

class Tree
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'tree'
    @repository = nil
    @install_command = Package.apt_install('tree')
    @verify_name = 'tree'
    super(@package_name, @repository, @install_command, @verify_name)
  end

end

