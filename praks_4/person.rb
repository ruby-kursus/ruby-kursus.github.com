#encoding: utf-8

class Person < Struct.new(:name, :height, :weight)
  def self.create(*args)
    [Woman, Man].sample.new *args
  end

  def initialize *args
    super *args

    init_default_values rescue nil
  end

  def info
    "Olen #{name}, kaalun #{weight}kg, olen #{height}cm pikk, kmi on #{bmi.round(2)}"
  end

  def bmi
    (self.weight / height_in_meters**2)
  end

  def man?
    is_a?(Man)
  end

  def woman?
    !man?
  end

  private

  def height_in_meters
    self.height/100.0
  end
end

class Man < Person
  private

  def init_default_values
    self.name   ||= %w{Andres Jüri Martin Toomas Rein}.sample
    self.height ||= 181 + rand(20)-10
    self.weight ||= 78 + rand(10)-5
  end
end

class Woman < Person
  private

  def init_default_values
    self.name   ||= %w{Anna Maria Tiina Sirje Anne}.sample
    self.height ||= 165 + rand(16)-8
    self.weight ||= 69 + rand(10)-5
  end
end

# add something to hash
module HashAdditions
  def to_person
    person_class.new *person_fields
  end

  private

  def person_class
    if self[:sex] == :male
      Man
    elsif self[:sex] == :female
      Woman
    end
  end

  def person_fields
    [self[:name], self[:height], self[:weight]]
  end
end

Hash.send :include, HashAdditions