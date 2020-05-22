class Table
  attr_accessor :column_width_list, :row_list

  def initialize(data)
    @data = data
    @column_width_list = []
    @row_list = []
    parse_data
  end

  def parse_data
    @data.each { |row| @row_list << Row.new(row, self) }
  end

  def to_s
    divider = "\n+" + column_width_list.map { |width| '-' * width }.join('+') + "+\n"
    divider + row_list.map(&:to_s).join(divider) + divider
  end
end
