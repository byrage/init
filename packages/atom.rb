require_relative 'package'

class Atom
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'atom'
    @repository = nil
    @install_command = wget_download('atom.deb', 'https://atom.io/download/deb', true) + dpkg_install('atom.deb')
    @verify_name = @package_name
  end

end

