require_relative 'package'

class ZshAndOhMyZsh
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'zsh'
    @repository = nil
    @install_command = apt_install(@package_name)
    +`curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`
    @verify_name = @package_name
  end

end

