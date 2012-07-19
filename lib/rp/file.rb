module Rp
  class File < Resource

    def initialize(destination, content=nil)
      @destination = destination
      @content = content
      create
    end

    def create
      ::File.open(@destination, 'w+') do |f|
        f << @content
      end

      say_status(:create, @destination, :green)
    end

  end
end
