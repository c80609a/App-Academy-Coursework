require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    # debugger
    vals = params.values
    where_line = params.keys.map do |key|
      "#{key} = ?"
    end
    if params.keys.count > 1
      where_line.join(' AND ')
    else
      where_line.to_s
    end

    data = DBConnection.execute(<<-SQL, *vals)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL
    return nil if data.first.empty?
    parse_all(data)

  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
