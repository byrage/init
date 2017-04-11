require_relative 'package'

class Franz
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'franz'
    @repository = nil
    @install_command = wget_download('franz.tgz', 'https://github.com/meetfranz/franz-app/releases/download/4.0.2/Franz-linux-x64-4.0.2.tgz', @continue)
    +`mkdir /opt/franz && tar -xvzf franz.tgz -C /opt/franz`
    +`ln -sf /opt/franz/Franz /usr/local/bin/franz`
    @verify_name = @package_name
  end

end

