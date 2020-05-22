class Cell
  attr_reader :value, :row, :table, :index, :align

  def initialize(value, row, table, index)
    @value ||= [value.to_s]
    @align ||= :right
    @row = row
    @table = table
    @index = index
    change_column_width
  end

  def change_column_width
    column_width = table.column_width_list[index] || 0
    table.column_width_list[index] = [column_width, cell_width].max
  end

  def cell_width
    value.map(&:length).max
  end

  def to_s(line)
    column_width = table.column_width_list[index]
    value_string = value[line - 1].to_s
    align == :left ? value_string.ljust(column_width) : value_string.rjust(column_width)
  end
end
