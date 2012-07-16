module Rp
  class Directory

    def initialize(name)
      @dir_name = name
    end

    def create
      Dir.mkdir(@dir_name)
    end

  end
end
