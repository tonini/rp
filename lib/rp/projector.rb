module Rp
  class Projector

    DEFAULT_RUBY_VERSION = 'ruby-1.9.3'

    def initialize(name, options={})
      @name = name
      @ruby_version = options[:ruby_version] || DEFAULT_RUBY_VERSION
    end

    def build(output=STDOUT)
      directory = Rp::Directory.new(@name)

      ruby = Rp::File.new(::File.join(@name, 'ruby.rb'), file_content[:template])
      rvmrc = Rp::File.new(::File.join(@name, '.rvmrc'), file_content[:rvmrc])

      directory.create
      rvmrc.create(output)
      ruby.create(output)

      output << "Built empty ruby enviroment in %s\n" % [@name]
    end

    def file_content
      {
        :rvmrc => "rvm --create %s@%s\n" % [@ruby_version, @name],
        :template => "# your ruby code ..."
      }
    end
    private :file_content

  end
end
