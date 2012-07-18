module Rp
  class File

    def self.create(name, content, directory, output=STDOUT)
      if ::File.exists?(::File.join(directory, name))
        p "ASDAS"
        output << "   #{Color.colorize("identical", :blue)}  #{::File.join(directory, name)}\n"
      else
        p ::File.join(directory, name)
        ::File.open(::File.join(directory, name), 'w+') do |f|
          f << content
        end

        output << "      #{Color.colorize("create", :green)}  #{::File.join(directory, name)}\n"
      end
    end

  end
end
