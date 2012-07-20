module Rp
  class File < Resource

    def create
      if file_status == :identical
        say_status(:identical, @destination, :blue)
      else
        ::File.open(@destination, 'w+') do |f|
          f << @content
        end
        say_status(:create, @destination, :green)
      end
    end

    def file_status
      if ::File.exists?(@destination)
        if ::File.binread(@destination) == @content
          :identical
        else
          :conflict
        end
      else
        :notexists
      end
    end

  end
end
