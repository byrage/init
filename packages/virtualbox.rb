require_relative 'package'

class VirtualBox
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'virtualbox'
    @repository = nil
    @install_command = wget_download('virtualbox.deb','http://download.virtualbox.org/virtualbox/5.1.4/virtualbox-5.1_5.1.4-110228~Ubuntu~xenial_amd64.deb', @continue)
    +dpkg_install('virtualbox.deb')
    @verify_name = @package_name
  end

end

