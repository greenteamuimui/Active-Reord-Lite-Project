require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
  end

  def table_name
    # ...
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    if options.empty?
      self.send("foreign_key=", "#{name.underscore}_id".to_sym)
      self.send("primary_key=", :id)
      self.send("class_name=", "#{name.camelcase}")
    else
      options.each do |pair|
        self.send("#{pair[0]}=", pair[-1])
      end
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    if options.empty?
      self.send("foreign_key=", "#{self_class_name.underscore}_id".to_sym)
      self.send("primary_key=", :id)
      self.send("class_name=", "#{name.camelcase}")
    else
      options.each do |pair|
        self.send("#{pair[0]}=", pair[-1])
      end
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
