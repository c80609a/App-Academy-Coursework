

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      name = name.to_s
      define_method("#{name}") { self.instance_variable_get("@#{name}") }
      define_method("#{name}=") do | value |
        self.instance_variable_set("@#{name}", value)
      end

    end
  end
end
