require 'optparse'
require 'ostruct'

module Rp
  class Options

    def self.parse(arguments)
      options = OpenStruct.new

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: rp [NAME] ... [OPTION] ..."

        opts.separator ""
        opts.separator "Specific options:"

        opts.on("-r", "--ruby-version [VERSION]", "ruby version used in .rvmrc file") do |r|
          options.ruby_version = r
        end

        opts.on_tail("-h", "--help", "display this help and exit") do
          $stdout.puts opts
          exit
        end

        opts.on_tail("-v", "--version", "show version") do
          $stdout.puts "rp, version #{Rp::VERSION}\n"
          exit
        end
      end

      begin
        arguments << "-h" if arguments.empty?
        opts.parse!(arguments)
        options.directory_name = arguments.first
      rescue OptionParser::ParseError => e
        STDERR.puts e.message, "\n", opts
        exit(-1)
      end

      options
    end

  end
end
