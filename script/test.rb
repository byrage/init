# require 'rubygems'
# require 'active_support/core_ext/string'
# klasses = Dir['../packages/*.rb'].map {|file| File.basename(file, '.rb').camelize.constantize }

# Dir['../packages/*.rb'].each {|file| require file}
# packages = [Atom.new]
#
# packages.each { |p|
#   print p.install_command
# }
class Test
  def self.load_and_instantiate(class_files)
    # Find all the classes in ObjectSpace before the requires
    before = ObjectSpace.each_object(Class).to_a
    # Require all files
    class_files.each { |file| require file }
    # Find all the classes now
    after = ObjectSpace.each_object(Class).to_a
    # Map on the difference and instantiate
    (after - before).map { |klass| klass.new }
  end

end

# Load them!
files = Dir.glob("../packages/git.rb")

objects = Test.load_and_instantiate(files)

objects.each { |o|
  print o
}