class Setup

  @skip=nil
  @continue=' && \ '
  @profile = '/etc/profile'

  # define methods
  def self.tryingMessage(package)
    puts `echo '\nInstalling #{package} ... \n\n\n'`
  end

  def self.addRepository(ppa, continue=@skip)
    puts `add-apt-repository -y ppa:#{ppa} #{continue}`
  end

  def self.aptUpdate(continue=@skip)
    puts `apt-get update #{continue}`
  end

  def self.aptInstall(package, continue=@skip)
    puts `apt-get -y install #{package} #{continue}`
  end

  def self.aptFixBrokenInstall(continue=@skip)
    puts `apt-get -f install #{continue}`
  end

  def self.wgetDownload(fileName, sourceUrl, continue=@skip)
    puts `wget -O #{fileName} #{sourceUrl} #{continue}`
  end

  def self.wgetRun(sourceUrl, continue=@skip)
    puts `wget -O - #{sourceUrl} | bash #{continue}`
  end

  def self.dpkgInstall(debName, continue=@skip)
    puts `dpkg -i #{debName} #{continue}`
  end

  def self.rm(fileName, continue=@skip)
    puts `rm #{fileName} #{continue}`
  end

  def self.exportInProfile(homeName, content, continue=@skip)
    if ENV["#{homeName}"] == nil
      puts `echo 'export #{homeName}=#{content}' >> #{@profile} #{continue}`
    end
  end

  def self.sourceProfile
    system("/bin/bash -c 'source #{@profile}'")
  end

  # use mirror
  puts `perl -pi -e "s/packages.linuxmint.com/ftp.kaist.ac.kr\/linuxmint/g" /etc/apt/sources.list.d/official-package-repositories.list`
  puts `perl -pi -e "s/archive.ubuntu.com/ftp.daum.net/g" /etc/apt/sources.list.d/official-package-repositories.list`

  # update
  aptUpdate
  puts `apt-get -y -o Dpkg::Options::= "--force-confdef" -o Dpkg::Options::= "--force-confold" upgrade`

  # Korean input method
  aptInstall 'uim uim-byeoru'

  # basic
  aptInstall 'curl'
  aptInstall 'tree'
  aptInstall 'vim'

  # git
  aptInstall 'git git-flow'

  # java 8
  puts `echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections`
  addRepository 'webupd8team/java', @continue
  aptUpdate @continue
  aptInstall 'oracle-java8-installer oracle-java8-set-default'
  exportInProfile 'JAVA_HOME', '/usr/lib/jvm/java-8-oracle/'
  sourceProfile
  
  # maven
  aptInstall 'maven'

  # gradle v2.14
  addRepository 'cwchien/gradle', @continue
  aptUpdate @continue
  aptInstall 'gradle-2.14'

  # atom editor
  wgetDownload 'atom.deb', 'https://atom.io/download/deb', @continue
  dpkgInstall 'atom.deb', @continue
  rm 'atom.deb'

  # terminator
  aptInstall 'terminator'

  # english dictionary
  aptInstall 'dict dictd dict-gcide dict-wn dict-devil espeak'

  # docker
  aptInstall 'docker.io'

  # nodejs, npm
  aptInstall 'nodejs npm'

  # virtual box
  wgetDownload 'virtualbox.deb', 'http://download.virtualbox.org/virtualbox/5.1.4/virtualbox-5.1_5.1.4-110228~Ubuntu~xenial_amd64.deb', @continue
  dpkgInstall 'virtualbox.deb'
  
  # chrome
  wgetDownload 'chrome.deb', 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb', @continue
  dpkgInstall 'chrome.deb', @continue
  aptInstall 'ttf-unfonts-core'

  # wps office
  wgetDownload 'wps-office.deb', 'http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb', @continue
  dpkgInstall 'wps-office.deb', @continue
  aptFixBrokenInstall @continue
  wgetDownload 'web-office-fonts.deb', 'http://kdl.cc.ksosoft.com/wps-community/download/fonts/wps-office-fonts_1.0_all.deb', @continue
  dpkgInstall 'web-office-fonts.deb', @continue
  rm '*office*.deb'

  # double commander
  addRepository 'alexx2000/doublecmd', @continue
  aptUpdate @continue
  aptInstall 'doublecmd-qt'

  # redis
  aptInstall 'redis-server'

  # mysql-client
  aptInstall 'mysql-client'

  # mysql-server
  MYSQL_PASSWORD='root'
  puts `echo 'mysql-server-5.5 mysql-server/root_password password "#{MYSQL_PASSWORD}"' | debconf-set-selections && \
        echo 'mysql-server-5.5 mysql-server/root_password_again password "#{MYSQL_PASSWORD}"' | debconf-set-selections && \ `
  aptInstall 'mysql-server-5.5'

  # mysql workbench
  wgetDownload 'mysql-workbench.deb', 'http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.7-1ubu1604-amd64.deb', @continue
  dpkgInstall 'mysql-workbench.deb', @continue
  rm 'mysql-workbench.deb'

  # gitkraken
  wgetDownload 'gitkraken.deb', 'https://release.gitkraken.com/linux/gitkraken-amd64.deb', @continue
  dpkgInstall 'gitkraken.deb', @continue
  rm 'gitkraken.deb'

  # franz
  wgetDownload 'franz.tgz', 'https://github.com/meetfranz/franz-app/releases/download/4.0.2/Franz-linux-x64-4.0.2.tgz', @continue
  puts `mkdir /opt/franz && tar -xvzf franz.tgz -C /opt/franz`
  puts `ln -sf /opt/franz/Franz /usr/local/bin/franz`

  # screencloud
  aptInstall 'screencloud'
  puts `echo 'deb http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_16.04/ /' > /etc/apt/sources.li    st.d/screencloud.list`

  # teamviewer
  aptInstall 'teamviewer'

  # zsh & oh-my-zsh
  aptInstall 'zsh'
  puts `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`
  
  # fixBroken & source
  aptFixBrokenInstall
  sourceProfile

  # verify it
  puts `wget -O verify.rb http://git.dreamer.co.kr/snippets/3/raw && \
        ruby verify.rb`

end
