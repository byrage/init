require_relative 'package'

class Diffuse
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'diffuse'
    @repository = nil
    @install_command = wget_download('diffuse-0.4.8.deb', 'https://sourceforge.net/projects/diffuse/files/diffuse/0.4.8/diffuse_0.4.8-1_all.deb/download')
    +dpkg_install('diffuse-0.4.8.deb')
    @verify_name = @package_name
  end

end

