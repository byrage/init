require_relative 'package'

class Vim
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'vim'
    @repository = nil
    @install_command = Package.apt_install('vim')
    @verify_name = 'vim'
    super(@package_name, @repository, @install_command, @verify_name)
  end

end

