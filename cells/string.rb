module Cells
  class String < Cell
    def initialize(value, *args)
      @value = value.split(' ')
      @align = :left
      super
      change_row_high
    end

    private

    def change_row_high
      row.high = value.count
    end
  end
end
