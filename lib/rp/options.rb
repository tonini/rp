require 'optparse'
require 'ostruct'

module Rp
  class Options

    def self.parse(arguments, output=STDOUT)
      options = OpenStruct.new

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: rp [NAME] ... [OPTION] ..."

        opts.separator ""
        opts.separator "Specific options:"

        opts.on("-r", "--ruby-version [VERSION]", "ruby version used in .rvmrc file") do |r|
          options.ruby_version = r
        end

        opts.on_tail("-h", "--help", "display this help and exit") do
          output << opts
          exit
        end
      end

      opts.order(arguments) {|argument| options.directory_name = argument; break}
      opts.parse!(arguments)

      options
    end

  end
end
