module Rp
  module ShellHelper

    def say_status(status, destination, color=nil)
      spaces = "  "

      status = status.to_s.rjust(12)
      status = Color.colorize(status, color) if color

      $stdout.puts "#{status}#{spaces}#{destination}"
    end

  end
end
