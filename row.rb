class Row
  attr_accessor :cell_list, :high
  attr_reader :row

  def initialize(row, table)
    @row = row
    @cell_list = []
    @high = 1
    @table = table
    parse_row
  end

  def parse_row
    row.to_h.each_with_index do |cell, i|
      key, value = cell
      cell_list << Object.const_get("Cells::#{key.capitalize}").new(value, self, @table, i)
    end
  end

  def to_s
    (1..high).map do |line|
      '|' + cell_list.map do |cell|
        cell.to_s(line)
      end.join('|') + '|'
    end.join("\n")
  end
end
