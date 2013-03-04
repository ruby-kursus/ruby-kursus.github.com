require './person'

p = {:sex=>:male, :name=>"Siim"}.to_person
raise "Hash.to_person not working" unless p.man?
raise "Hash.to_person not working with attribute" unless p.name=="Siim"

raise "Person contructor not working" unless Person.new("Norma").name == "Norma"
raise "Person.bmi not working" unless Person.new("Maximillian", 160, 70).bmi.round(2) == 27.34

10.times do
  # random person creation
  puts Person.create.info
end

puts "konkreetne inimene"
puts Person.create(nil, 180, 80).info
# specific with explicit sex

puts "konkreetne inimene"
puts Man.new("Erkki", 170, 80).info
