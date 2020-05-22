module Cells
  class Money < Int
    def initialize(value, *args)
      @value = [value_string(value)]
      super
    end

    private

    def value_string(value)
      div, mod = format('%.2f', value.round(2)).split('.')
      div_with_space = div.reverse.gsub(/...(?=.)/, '\& ').reverse
      "#{div_with_space}.#{mod}"
    end
  end
end
