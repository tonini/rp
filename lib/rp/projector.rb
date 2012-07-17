module Rp
  class Projector

    def initialize(name, options={})
      @name = name
      @ruby_version = options[:ruby_version] || default_ruby_version
    end

    def build(output=STDOUT)
      directory = Rp::Directory.new(@name)
      directory.create

      files_templates.each do |file|
        Rp::File.new(::File.join(@name, file[:name]), file[:content]).create(output)
      end

      output << "Built empty ruby enviroment in #{@name}\n"
    end

    def files_templates
      [{ :name => 'ruby.rb',
         :content => '# your ruby code ...' },
       { :name => '.rvmrc',
         :content => "rvm --create #{@ruby_version}@#{@name}\n" }]
    end
    private :files_templates

    def default_ruby_version
      'ruby-1.9.3'
    end
    private :default_ruby_version

  end
end
