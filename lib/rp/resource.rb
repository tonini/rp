module Rp
  class Resource

    include Rp::ShellHelper

    def initialize(destination, content=nil)
      @destination = destination
      @content = content

      create
    end

    def create
      raise 'Have to implemented.'
    end

  end
end
