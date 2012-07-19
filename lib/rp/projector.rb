module Rp
  class Projector

    def initialize(destination, options={})
      @destination = destination
      @ruby_version = options[:ruby_version] || default_ruby_version
    end

    def build
      Rp::Directory.new(@destination)

      file_templates.each do |file|
        destination = ::File.join(@destination, file[:name])

        Rp::File.new(destination, file[:content])
      end

      $stdout.puts "Built new ruby enviroment in #{destination_full_path}\n"
    end

    def file_templates
      [{ :name => 'ruby.rb',
         :content => '# your ruby code ...' },
       { :name => '.rvmrc',
         :content => "rvm --create #{@ruby_version}@#{@destination}\n" }]
    end

    def default_ruby_version
      'ruby-1.9.3'
    end

    def destination_full_path
      ::File.join(Dir.pwd, @destination)
    end

  end
end
