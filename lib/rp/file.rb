module Rp
  class File

    def initialize(name, content=nil)
      @name = name
      @content = content
    end

    def create(output=STDOUT)
      ::File.open(@name, 'w+') do |f|
        f << @content
      end
      output << "      create  %s\n" % [@name]
    end

  end
end
