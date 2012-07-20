module Rp
  class Resource

    include Rp::ShellHelper

    def initialize(destination, content='')
      @destination = destination
      @content = content

      create
    end

    def create
      raise 'Not implemented abstract method.'
    end

  end
end
