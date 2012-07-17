module Rp
  class Projector

    def initialize(dir_name, options={})
      @dir_name = dir_name
      @ruby_version = options[:ruby_version] || default_ruby_version
    end

    def build(output=STDOUT)
      Rp::Directory.create(@dir_name)

      files_templates.each do |file|
        Rp::File.create(::File.join(@dir_name, file[:name]), file[:content], output)
      end

      output << "Built empty ruby enviroment in #{@dir_name}\n"
    end

    def files_templates
      [{ :name => 'ruby.rb',
         :content => '# your ruby code ...' },
       { :name => '.rvmrc',
         :content => "rvm --create #{@ruby_version}@#{@dir_name}\n" }]
    end
    private :files_templates

    def default_ruby_version
      'ruby-1.9.3'
    end
    private :default_ruby_version

  end
end
