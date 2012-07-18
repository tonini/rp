module Rp
  class File

    def self.create(name, content=nil, output=STDOUT)
      ::File.open(name, 'w+') do |f|
        f << content
      end
      output << "      #{Color.colorize("create", :green)}  #{name}\n"
    end

  end
end
