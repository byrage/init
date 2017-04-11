require_relative 'package'

class Java8
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'java'
    @repository = 'webupd8team/java'
    @install_command =   puts `echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections`
    apt_install 'oracle-java8-installer oracle-java8-set-default'
    export_in_profile 'JAVA_HOME', '/usr/lib/jvm/java-8-oracle/'
    source_profile
    @verify_name = @package_name
  end

end

