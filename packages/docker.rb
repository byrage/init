require_relative 'package'

class Docker
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'docker'
    @repository = nil
    @install_command = apt_install('apt-transport-https ca-certificates curl software-properties-common' + @continue)
    +'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'
    +'sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"'
    @verify_name = @package_name
  end

end

