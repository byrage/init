require_relative 'package'

class ScreenCloud
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'screencloud'
    @repository = nil
    @install_command = `echo 'deb http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_16.04/ /' > /etc/apt/sources.li    st.d/screencloud.list`
    +apt_install('screencloud')
    @verify_name = @package_name
  end

end

