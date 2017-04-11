require_relative 'package'

class MySql
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name
  MYSQL_PASSWORD='root'

  def initialize
    @package_name = 'mysql-client mysql-client'
    @repository = nil
    @install_command = puts `echo 'mysql-server-5.5 mysql-server/root_password password "#{MYSQL_PASSWORD}"' | debconf-set-selections && \
        echo 'mysql-server-5.5 mysql-server/root_password_again password "#{MYSQL_PASSWORD}"' | debconf-set-selections && \ `
    +apt_install(@package_name)
    @verify_name = @package_name
  end

end

