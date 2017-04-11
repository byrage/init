require_relative 'package'

class Chrome
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'chrome'
    @repository = nil
    @install_command = wget_download('chrome.deb', 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb', @continue)
    +dpkg_install('chrome.deb', @continue)
    +apt_install('ttf-unfonts-core')
    @verify_name = @package_name
  end

end

