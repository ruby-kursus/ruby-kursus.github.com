#encoding: utf-8

class Person
  
  class Statistics
    @@people = []
    
    def self.add_person(person)
      @@people << person
    end
    
    def self.total
      @@people.size
    end
    
    def self.average_height
      @@people.collect {|p| p.height}.average
    end
    
    def self.average_weight
      @@people.collect {|p| p.age}.average
    end
    
    def self.average_age
      @@people.collect {|p| p.age}.average
    end
    
    def self.average_bmi
      @@people.collect {|p| p.bmi}.average
    end
  end
  
  attr_accessor :weight, :height, :sex, :age
  
  def initialize(options = {})
    @sex    = options[:sex] || [:male, :female].sample
    @weight = options[:weight] || (20..150).to_a.sample
    @height = options[:height] || (155..195).to_a.sample
    @age    = options[:age] || (10..90).to_a.sample
    Statistics.add_person(self)
  end
  
  def bmi
    (@weight.to_f / (height_in_meters ** 2)).round(1)
  end
  
  private
  
  def height_in_meters
    @height / 100
  end
end

class Array
  def sum
    inject(0.0) { |result, el| result + el }
  end

  def average
    (sum.to_f / size).round(2)
  end
end

class Hash
  def to_person
    Person.new(self)
  end
end

p = Person.new
Person::Statistics.total