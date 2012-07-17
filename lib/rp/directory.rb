module Rp
  class Directory

    def initialize(name)
      @dir_name = name
    end

    def create
      FileUtils.mkdir_p(@dir_name)
    end

  end
end
