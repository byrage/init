# TODO : list option / install with parameters
# XXX setup []
# XXX verify []
# XXX customize []
class Setup

  def self.add_repository(ppa)
    `add-apt-repository -y ppa:#{ppa}`
  end

  def self.apt_update(continue=@skip)
    `apt-get update #{continue}`
  end

  # change mirror
  puts `sed -i 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list`

  Dir['../packages/*.rb'].each { |file| require file }
  # packages = [Tree.new, Uim.new, Java8.new]
  packages = [Curl.new]

  # add repository and update
  packages.each { |p|
    unless p.repository.nil?
      exec add_repository(p.repository)
    end
  }
  apt_update

  # install packages
  packages.each { |p|
    unless p.install_command.nil?
      exec p.install_command
    end
  }

  apt_fix_broken_install
  source_profile
end
