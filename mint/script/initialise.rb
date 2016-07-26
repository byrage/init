#!/usr/bin/env ruby
class Initialise

  puts `set -e`

  def self.existCommand(dir)
    puts `echo exists? "#{dir}"`
    puts `type "#{dir}" &> /dev/null`
  end

  # use mirror
  puts `perl -pi -e "s/packages.linuxmint.com/ftp.kaist.ac.kr\/linuxmint/g" /etc/apt/sources.list.d/official-package-repositories.list`
  puts `perl -pi -e "s/archive.ubuntu.com/ftp.daum.net/g" /etc/apt/sources.list.d/official-package-repositories.list`

  puts `apt-get update`
  puts `apt-get -y -o Dpkg::Options::= "--force-confdef" -o Dpkg::Options::= "--force-confold" upgrade`

  # Korean input method
  puts `apt-get -y install uim uim-byeoru`

  # basic
  puts `existCommand curl || \
        apt-get -y install curl`

  # git
  puts `existCommand git || \
        apt-get -y install git git-flow`

  # java 8
  puts `[-d "/usr/lib/jvm/java-8-oracle"] || (\
        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
        add-apt-repository -y ppa : webupd8team/java && \
        apt-get update && \
        apt-get install -y oracle-java8-installer oracle-java8-set-default && \
        echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle/' >> /etc/ profile)`

  # maven
  puts `existCommand mvn || (\
        apt-add-repository -y ppa : andrei-pozolotin/maven3 && \
        apt-get update && \
        apt-get -y install maven3)`

  # intelliJ
  puts `mkdir -p /opt
        existCommand idea || \
        source <(curl -s https://gist.githubusercontent.com/YuriyGuts/a06b5976ccc8434913b9/raw/89e7
        dec823af878a87aff7aaee5f1ac590366ba1/linux-install-intellij-idea.sh)`

  # gradle
  puts `existCommand gradle || (\
        add-apt-repository -y ppa : cwchien/gradle && \
        apt-get update && \
        apt-get -y install gradle && \
        echo 'export GRADLE_HOME=/usr/lib/gradle/default' >> /etc/ profile)`

  # ruby
  puts `existCommand rvm || (\
        gpg --keyserver hkp : // keys.gnupg.net --recv-keys 409 B6B1796C275462A1703113804BB82D39DC0E3 && \
        curl -sSL https : // get.rvm.io | bash -s stable && \
        source /etc/ profile.d/rvm.sh && \
        rvm install jruby-9.0 .4 .0)`

  # atom editor
  puts `existCommand atom || (\
        add-apt-repository -y ppa : webupd8team/atom && \
        apt-get update && \
        apt-get -y install atom)`

  # terminator
  puts `existCommand terminator || \
        apt-get -y install terminator`

  # english dictionary
  puts `existCommand dict || \
        apt-get -y install dict dictd dict-gcide dict-wn dict-devil espeak`

  # docker
  puts `existCommand docker || \
        apt-get -y install docker.io`

  # nodejs, npm
  puts `existCommand npm || \
        apt-get -y install nodejs npm`

  # virtual box
  puts `existCommand vboxmanage || (\
        echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" > /etc/ apt/sources.list.d/virtualbox.list && \
        wget -q https : // www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - && \
        apt-get update && \
        apt-get -y install virtualbox-5.0)`

  # chrome
  puts `existCommand google-chrome || (\
        wget -q -O - https : // dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
        echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/ apt/sources.list.d/google-chrome.list && \
        apt-get update && \
        apt-get -y install google-chrome-stable ttf-unfonts-core)`

  # tree
  puts `existCommand tree || \
        apt-get -y install tree`

end