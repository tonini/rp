module Rp
  class Projector

    def initialize(dir_name, options={})
      @dir_name = dir_name
      @ruby_version = options[:ruby_version] || default_ruby_version
    end

    def build
      Rp::Directory.create(@dir_name)

      files_templates.each do |file|
        Rp::File.create(::File.join(@dir_name, file[:name]), file[:content])
      end

      $stdout.puts "Built new ruby enviroment in #{destination_full_path}\n"
    end

    def files_templates
      [{ :name => 'ruby.rb',
         :content => '# your ruby code ...' },
       { :name => '.rvmrc',
         :content => "rvm --create #{@ruby_version}@#{@dir_name}\n" }]
    end

    def default_ruby_version
      'ruby-1.9.3'
    end

    def destination_full_path
      ::File.join(Dir.pwd, @dir_name)
    end

  end
end
