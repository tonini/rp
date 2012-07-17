require 'fileutils'

module Rp
  class Directory

    def self.create(name)
      FileUtils.mkdir_p(name)
    end

  end
end
