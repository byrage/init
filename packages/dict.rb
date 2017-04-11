require_relative 'package'

class Dict
  include Package

  attr_reader :package_name, :repository, :install_command, :verify_name

  def initialize
    @package_name = 'dict dictd dict-gcide dict-wn dict-devil espeak'
    @repository = nil
    @install_command = apt_install('dict')
    @verify_name = 'dict'
  end

end

