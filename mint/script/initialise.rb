#!/usr/bin/env ruby
class Initialise

  # TODO : search 'set' command to do, and fix it
  # puts `set -e`

  # TODO : convert existCommand to ruby
  def self.existCommand(command)
    puts `echo exists? "#{command}"`
    puts `type "#{command}" &> /dev/null`
  end

  # use mirror
  puts `perl -pi -e "s/packages.linuxmint.com/ftp.kaist.ac.kr\/linuxmint/g" /etc/apt/sources.list.d/official-package-repositories.list`
  puts `perl -pi -e "s/archive.ubuntu.com/ftp.daum.net/g" /etc/apt/sources.list.d/official-package-repositories.list`

  puts `apt-get update`
  puts `apt-get -y -o Dpkg::Options::= "--force-confdef" -o Dpkg::Options::= "--force-confold" upgrade`

  # Korean input method
  puts `apt-get -y install uim uim-byeoru`

  # basic
  # existCommand curl
  puts `apt-get -y install curl`

  # git
  # existCommand git
  puts `apt-get -y install git git-flow`

  # java 8
  puts `[ -d "/usr/lib/jvm/java-8-oracle" ] || (\
        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
        add-apt-repository -y ppa : webupd8team/java && \
        apt-get update && \
        apt-get install -y oracle-java8-installer oracle-java8-set-default && \
        echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle/' >> /etc/profile)`

  # maven
  # existCommand mvn
  puts `apt-add-repository -y ppa : andrei-pozolotin/maven3 && \
        apt-get update && \
        apt-get -y install maven3`

  # intelliJ
  # existCommand idea
  puts `mkdir -p /opt
        source < (curl -s https://gist.githubusercontent.com/YuriyGuts/a06b5976ccc8434913b9/raw/89e7
        dec823af878a87aff7aaee5f1ac590366ba1/linux-install-intellij-idea.sh)`

  # gradle
  # existCommand gradle
  puts `add-apt-repository -y ppa : cwchien/gradle && \
        apt-get update && \
        apt-get -y install gradle && \
        echo 'export GRADLE_HOME=/usr/lib/gradle/default' >> /etc/profile`

  # atom editor
  # existCommand atom
  puts `add-apt-repository -y ppa : webupd8team/atom && \
        apt-get update && \
        apt-get -y install atom`

  # terminator
  # existCommand terminator
  puts `apt-get -y install terminator`

  # english dictionary
  # existCommand dict
  puts `apt-get -y install dict dictd dict-gcide dict-wn dict-devil espeak`

  # docker
  # existCommand docker
  puts `apt-get -y install docker.io`

  # nodejs, npm
  # existCommand npm
  puts `apt-get -y install nodejs npm`

  # virtual box
  # existCommand vboxmanage
  puts `echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" > /etc/ apt/sources.list.d/virtualbox.list && \
        wget -q https : // www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - && \
        apt-get update && \
        apt-get -y install virtualbox-5.0`

  # chrome
  # existCommand google-chrome
  puts `wget -q -O - https : // dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
        echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/ apt/sources.list.d/google-chrome.list && \
        apt-get update && \
        apt-get -y install google-chrome-stable ttf-unfonts-core`

  # tree
  # existCommand tree
  puts `apt-get -y install tree`

  # vim
  puts `apt-get -y install vim`

  # verifiy it
  puts `ruby verify.rb`

end