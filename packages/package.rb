module Package

  attr_reader :user, :homeDirectory, :profile

  @@continue=' && '

  def initialize
    @user = `echo $USER`.strip
    @homeDirectory = `echo $HOME`.strip
    @profile = @homeDirectory + '.profile'
  end

  def apt_install(package, is_continue=false)
    "apt-get install -y #{package}" + (is_continue ? @@continue : '')
  end

  def apt_fix_broken_install(is_continue=false)
    'apt-get install -f' + (is_continue ? @@continue : '')
  end

  def wget_download(fileName, sourceUrl, is_continue=false)
    "wget -O #{fileName} #{sourceUrl}" + (is_continue ? @@continue : '')
  end

  def wget_run(sourceUrl, is_continue=false)
    "wget -O - #{sourceUrl} | bash" + (is_continue ? @@continue : '')
  end

  def dpkg_install(debName, is_continue=false)
    "dpkg -i #{debName}" + (is_continue ? @@continue : '')
  end

  def rm(fileName, is_continue=false)
    "rm #{fileName}" + (is_continue ? @@continue : '')
  end

  def export_in_profile(homeName, content, is_continue=false)
    if ENV["#{homeName}"] == nil
      puts `echo 'export #{homeName}=#{content}' >> #{@profile} #{is_continue ? @continue : nil}`
    end
  end

  def source_profile
    system("/bin/bash -c 'source #{@profile}'")
  end

  module_function :apt_install, :apt_fix_broken_install, :wget_download,
                  :wget_run, :dpkg_install, :rm, :export_in_profile, :source_profile
end