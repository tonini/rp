module Rp
  class Project

    def initialize(name)
      @name = name
    end

    def create(output=STDOUT)
      Dir.mkdir(@name)

      File.new(File.join(@name, 'ruby.rb'), 'w+')
      output << "      create  %s/ruby.rb\n" % [@name]

      File.open(File.join(@name, '.rvmrc'), 'w+') do |rvmrc_file|
        rvmrc_file << "rvm --create ruby-1.9.3@%s\n" % [@name]
      end
      output << "      create  #{@name}/.rvmrc\n"
      output << "Built empty ruby enviroment in %s\n" % [@name]
    end

  end
end
