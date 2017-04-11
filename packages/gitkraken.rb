require_relative 'package'

class GitKraken
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'gitkraken'
    @repository = nil
    @install_command = wget_download('gitkraken.deb', 'https://release.gitkraken.com/linux/gitkraken-amd64.deb', @continue)
    +dpkg_install('gitkraken.deb')
    @verify_name = @package_name
  end

end

