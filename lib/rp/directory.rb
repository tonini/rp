require 'fileutils'

module Rp
  class Directory < Resource

    def create
      FileUtils.mkdir_p(@destination)
    end

  end
end
