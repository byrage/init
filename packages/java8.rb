require_relative 'package'

class Java8
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'vim'
    @repository = 'webupd8team/java'
    @verify_name = 'vim'
    @install_command = "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt install -y oracle-java8-installer oracle-java8-set-default && \
    export JAVA_HOME='/usr/lib/jvm/java-8-oracle/' >> /etc/profile && \
        /bin/bash -c 'source #{@profile}'"
  end

end

