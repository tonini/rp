require 'fileutils'

module Rp
  class Directory < Resource

    def initialize(destination)
      @destination = destination
      create
    end

    def create
      FileUtils.mkdir_p(@destination)
    end

  end
end
