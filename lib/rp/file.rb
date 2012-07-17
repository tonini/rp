module Rp
  class File

    def self.create(name, content=nil, output=STDOUT)
      ::File.open(name, 'w+') do |f|
        f << content
      end
      output << "      create  #{name}\n"
    end

  end
end
