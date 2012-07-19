module Rp
  class File < Resource

    def create
      ::File.open(@destination, 'w+') do |f|
        f << @content
      end

      say_status(:create, @destination, :green)
    end

  end
end
