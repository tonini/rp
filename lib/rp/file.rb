module Rp
  class File

    def self.create(name, content=nil)
      ::File.open(name, 'w+') do |f|
        f << content
      end

      say_status(:create, name, :green)
    end

    def self.say_status(status, destination, color=nil)
      spaces = "  "

      status = status.to_s.rjust(12)
      status = Color.colorize(status, color) if color

      $stdout.puts "#{status}#{spaces}#{destination}"
    end

  end
end
