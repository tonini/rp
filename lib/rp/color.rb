module Rp
  class Color

    def self.colorize(text, color)
      "#{colors[color]}#{text}#{close}"
    end

    def self.colors
      {
        :green => "\e[32m"
      }
    end

    def self.close
      "\e[0m"
    end

  end
end
