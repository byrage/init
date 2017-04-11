require_relative 'package'

class WpsOffice
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'wps'
    @repository = nil
    @install_command = wget_download('wps-office.deb', 'http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb', @continue)
    +dpkg_install('wps-office.deb', @continue)
    +apt_fix_broken_install(@continue)
    +wget_download('web-office-fonts.deb', 'http://kdl.cc.ksosoft.com/wps-community/download/fonts/wps-office-fonts_1.0_all.deb', @continue)
    +dpkg_install('web-office-fonts.deb', @continue)
    @verify_name = @package_name
  end

end

