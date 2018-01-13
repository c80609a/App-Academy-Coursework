require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns ==  nil
      data = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
      SQL
      arr = data.first
      @columns = arr.map! {|item| item.to_sym}
    end

    @columns

  end

  def self.finalize!
    self.columns.each do |name|
      define_method("#{name}") { self.attributes[name] }
      define_method("#{name}=") do | value |
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||=  self.name.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name};
      SQL
    self.parse_all(data)
  end

  def self.parse_all(results)
    # ...results is a hash of key value pairs
    return_array = []
    results.each do |row_hash|
      return_array << self.new(row_hash)
    end
    return_array
  end

  def self.find(id)
    # ...
    data = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
      LIMIT
        1;
    SQL
    return nil if data.empty?
    self.new(data.first)
  end

  def initialize(params = {})
    # ...
    params.each do |key, value|
      own_class = self.class
      raise "unknown attribute '#{key}'" unless own_class.columns.include?(key.to_sym)
      #debugger
      self.send("#{key}=", value)

    end
  end

  def attributes
    @attributes ||= {}


  end

  def attribute_values
    # needs to return an array of the values
    ret_array = []

    self.class.columns.each do |col_name|
      ret_array << self.send("#{col_name}")
    end
    ret_array
  end

  def insert
    # debugger
    cols = self.class.columns[1..-1]
    col_names = cols.join(",")
    marks = Array.new(cols.count, "?")
    marks = marks.join(",")
    vals = attribute_values[1..-1]

    DBConnection.execute(<<-SQL, vals)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{marks})
    SQL

    self.id = DBConnection.last_insert_row_id

  end

  def update
    # ...
    
    cols = self.class.columns[1..-1]
    col_names = cols.map { |name| "#{name} = ?" }.join(',')
    vals = attribute_values.rotate

    DBConnection.execute(<<-SQL, vals)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = ?;
    SQL
  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
  end
end
