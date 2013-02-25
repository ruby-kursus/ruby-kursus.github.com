require './person'

p = {:sex=>:male, :name=>"Siim"}.to_person
raise "Hash.to_person not working" unless p.man?
raise "Hash.to_person not working with attribute" unless p.name=="Siim"

raise "Person contructor not working" unless Person.new("Norma").name == "Norma"
raise "Person.bmi not working" unless Person.new("Maximillian", 160, 70).bmi.round(2) == 27.34