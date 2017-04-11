class Setup

  @skip=nil
  @continue=' && \ '
  @profile = '/etc/profile'

  def self.trying_message(package)
    puts `echo '\nInstalling #{package} ... \n\n\n'`
  end

  def self.apt_update(continue=@skip)
    puts `apt-get update #{continue}`
  end

  # use mirror
  puts `perl -pi -e "s/packages.linuxmint.com/ftp.kaist.ac.kr\/linuxmint/g" /etc/apt/sources.list.d/official-package-repositories.list`
  puts `perl -pi -e "s/archive.ubuntu.com/ftp.daum.net/g" /etc/apt/sources.list.d/official-package-repositories.list`

  Dir['../packages/*.rb'].each { |file| require file }
  packages = [Tree.new, Uim.new]

  # add repository and update
  packages.each { |p|
    unless p.repository.nil?
      # exec p.repository
    end
  }
  apt_update
  puts `apt-get -y -o Dpkg::Options::= "--force-confdef" -o Dpkg::Options::= "--force-confold" upgrade`

  # install packages
  packages.each { |p|

    exec p.install_command
  }

  # java 8
  puts `echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections`
  apt_install 'oracle-java8-installer oracle-java8-set-default'
  export_in_profile 'JAVA_HOME', '/usr/lib/jvm/java-8-oracle/'
  source_profile

  # maven
  apt_install 'maven'

  # gradle v2.14
  add_repository 'cwchien/gradle', @continue
  apt_update @continue
  apt_install 'gradle-2.14'

  # atom editor
  wget_download 'atom.deb', 'https://atom.io/download/deb', @continue
  dpkg_install 'atom.deb', @continue
  rm 'atom.deb'

  # terminator
  apt_install 'terminator'

  # english dictionary
  apt_install 'dict dictd dict-gcide dict-wn dict-devil espeak'

  # docker
  apt_install 'docker.io'

  # virtual box
  wget_download 'virtualbox.deb', 'http://download.virtualbox.org/virtualbox/5.1.4/virtualbox-5.1_5.1.4-110228~Ubuntu~xenial_amd64.deb', @continue
  dpkg_install 'virtualbox.deb'

  # chrome
  wget_download 'chrome.deb', 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb', @continue
  dpkg_install 'chrome.deb', @continue
  apt_install 'ttf-unfonts-core'

  # wps office
  wget_download 'wps-office.deb', 'http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb', @continue
  dpkg_install 'wps-office.deb', @continue
  apt_fix_broken_install @continue
  wget_download 'web-office-fonts.deb', 'http://kdl.cc.ksosoft.com/wps-community/download/fonts/wps-office-fonts_1.0_all.deb', @continue
  dpkg_install 'web-office-fonts.deb', @continue
  rm '*office*.deb'

  # redis
  apt_install 'redis-server'

  # mysql-client
  apt_install 'mysql-client'

  # mysql-server
  MYSQL_PASSWORD='root'
  puts `echo 'mysql-server-5.5 mysql-server/root_password password "#{MYSQL_PASSWORD}"' | debconf-set-selections && \
        echo 'mysql-server-5.5 mysql-server/root_password_again password "#{MYSQL_PASSWORD}"' | debconf-set-selections && \ `
  apt_install 'mysql-server-5.5'

  # mysql workbench
  wget_download 'mysql-workbench.deb', 'http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.7-1ubu1604-amd64.deb', @continue
  dpkg_install 'mysql-workbench.deb', @continue
  rm 'mysql-workbench.deb'

  # gitkraken
  wget_download 'gitkraken.deb', 'https://release.gitkraken.com/linux/gitkraken-amd64.deb', @continue
  dpkg_install 'gitkraken.deb', @continue
  rm 'gitkraken.deb'

  # franz
  wget_download 'franz.tgz', 'https://github.com/meetfranz/franz-app/releases/download/4.0.2/Franz-linux-x64-4.0.2.tgz', @continue
  puts `mkdir /opt/franz && tar -xvzf franz.tgz -C /opt/franz`
  puts `ln -sf /opt/franz/Franz /usr/local/bin/franz`

  # screencloud
  apt_install 'screencloud'
  puts `echo 'deb http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_16.04/ /' > /etc/apt/sources.li    st.d/screencloud.list`

  # teamviewer
  apt_install 'teamviewer'

  # zsh & oh-my-zsh
  apt_install 'zsh'
  puts `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`

  # clementine
  add_repository 'ppa:me-davidsansome/clementine'
  apt_install 'clementine'

  # diffuse
  wget_download 'diffuse-0.4.8.deb', 'https://sourceforge.net/projects/diffuse/files/diffuse/0.4.8/diffuse_0.4.8-1_all.deb/download'
  dpkg_install 'diffuse-0.4.8.deb'

  # fixBroken & source
  apt_fix_broken_install
  source_profile

  # verify it
  puts `wget -O verify.rb http://git.dreamer.co.kr/snippets/3/raw && \
        ruby verify.rb`

end
