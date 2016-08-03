#!/usr/bin/env ruby
class Setup

  @skip=nil
  @continue=' && \ '
  @profile = '/etc/profile'

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
    puts `echo 'export #{homeName}=#{content}' >> #{@profile} #{continue}`
  end

  # use mirror
  puts `perl -pi -e "s/packages.linuxmint.com/ftp.kaist.ac.kr\/linuxmint/g" /etc/apt/sources.list.d/official-package-repositories.list`
  puts `perl -pi -e "s/archive.ubuntu.com/ftp.daum.net/g" /etc/apt/sources.list.d/official-package-repositories.list`

  aptUpdate
  puts `apt-get -y -o Dpkg::Options::= "--force-confdef" -o Dpkg::Options::= "--force-confold" upgrade`

  # Korean input method
  aptInstall 'uim uim-byeoru'

  # basic
  aptInstall 'curl'

  # git
  aptInstall 'git git-flow'

  # java 8
  puts `[ -d "/usr/lib/jvm/java-8-oracle" ] || (\
        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \ `
  addRepository 'webup8team/java', @continue
  aptUpdate @continue
  aptInstall 'oracle-java8-installer oracle-java8-set-default', @continue
  exportInProfile 'JAVA_HOME', '/usr/lib/jvm/java-8-oracle/', ')'

  # maven
  addRepository 'andrei-pozolotin/maven3', @continue
  aptUpdate @continue
  aptInstall 'maven3'

  # intelliJ
  puts `mkdir -p /opt && \ `
  wgetRun 'https://gist.githubusercontent.com/YuriyGuts/a06b5976ccc8434913b9/raw/409a135d3f5174512b13281cbce6aa29211bed77/linux-install-intellij-idea.sh'

  # gradle
  addRepository 'cwchien/gradle', @continue
  aptUpdate @continue
  aptInstall 'gradle', @continue
  exportInProfile 'GRADLE_HOME', '/usr/lib/gradle/default'

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
  puts `echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" > /etc/ apt/sources.list.d/virtualbox.list && \
        wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - && \ `
  aptUpdate @continue
  aptInstall 'virtualbox-5.0'

  # chrome
  wgetDownload 'chrome.deb', 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb', @continue
  dpkgInstall 'chrome.deb', @continue
  aptInstall 'ttf-unfonts-core'

  # tree
  aptInstall 'tree'

  # vim
  aptInstall 'vim'

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

  # verify it
  puts `ruby verify.rb`

end