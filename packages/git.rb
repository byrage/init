require_relative 'package'

class Gitt
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'git git-flow'
    @repository = nil
    @install_command = Package.apt_install('git')
    @verify_name = 'git'
    super(@package_name, @repository, @install_command, @verify_name)
  end

end

