require 'csv'
require_relative 'cell'
require_relative 'cells/int'
require_relative 'cells/money'
require_relative 'cells/string'
require_relative 'table'
require_relative 'row'
require 'pry'

data = CSV.table('data.csv', col_sep: ';')
table = Table.new(data)
puts table
