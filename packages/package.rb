module Package

  attr_reader :user, :homeDirectory, :profile

  def initialize
    @user = `echo $USER`.strip
    @homeDirectory = `echo $HOME`.strip
    @profile = @homeDirectory + '.profile'
  end

  def apt_install(package, continue=@skip)
    "apt-get install -y #{package} #{continue}"
  end

  def apt_fix_broken_install(continue=@skip)
    puts `apt-get install -f #{continue}`
  end

  def wget_download(fileName, sourceUrl, continue=@skip)
    puts `wget -O #{fileName} #{sourceUrl} #{continue}`
  end

  def wget_run(sourceUrl, continue=@skip)
    puts `wget -O - #{sourceUrl} | bash #{continue}`
  end

  def dpkg_install(debName, continue=@skip)
    puts `dpkg -i #{debName} #{continue}`
  end

  def rm(fileName, continue=@skip)
    puts `rm #{fileName} #{continue}`
  end

  def export_in_profile(homeName, content, continue=@skip)
    if ENV["#{homeName}"] == nil
      puts `echo 'export #{homeName}=#{content}' >> #{@profile} #{continue}`
    end
  end

  def source_profile
    system("/bin/bash -c 'source #{@profile}'")
  end

  module_function :apt_install, :apt_fix_broken_install, :wget_download,
                  :wget_run, :dpkg_install, :rm, :export_in_profile, :source_profile
end