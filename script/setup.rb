class Setup

  @skip=nil
  @continue=' && \ '
  @profile = '/etc/profile'

  def self.trying_message(package)
    puts `echo '\nInstalling #{package} ... \n\n\n'`
  end

  def self.add_repository(ppa)
    puts `add-apt-repository -y ppa:#{ppa}`
  end

  def self.apt_update(continue=@skip)
    puts `apt-get update #{continue}`
  end

  # use mirror
  puts `perl -pi -e "s/packages.linuxmint.com/ftp.kaist.ac.kr\/linuxmint/g" /etc/apt/sources.list.d/official-package-repositories.list`
  puts `perl -pi -e "s/archive.ubuntu.com/ftp.daum.net/g" /etc/apt/sources.list.d/official-package-repositories.list`

  Dir['../packages/*.rb'].each { |file| require file }
  # packages = [Tree.new, Uim.new, Java8.new]
  packages = [Java8.new]

  # add repository and update
  packages.each { |p|
    unless p.repository.nil?
      # exec add_repository(p.repository)
    end
  }
  # apt_update
  # puts `apt-get -y -o Dpkg::Options::= "--force-confdef" -o Dpkg::Options::= "--force-confold" upgrade`

  # install packages
  packages.each { |p|

    # if p.install_command.nil?
      print p.install_command
    # end
    # exec p.install_command
  }
end
