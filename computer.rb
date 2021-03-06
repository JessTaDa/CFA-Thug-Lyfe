# create Computer class
class Computer
# set attributor accessors
 attr_accessor :name, :score

# initialize method
 def initialize(name)
   @name = name
   @score = 0
 end

# method to assign probability of commputer choosing the correct answer in %
 def assign_prob(answers)
   case answers
     when 'A'
       return random_answer({"A" => 70, "B" => 10, "C" => 10, "D" => 10 })
     when 'B'
       return random_answer({"A" => 10, "B" => 70, "C" => 10, "D" => 10 })
     when 'C'
       return random_answer({"A" => 10, "B" => 10, "C" => 70, "D" => 10 })
     when 'D'
       return random_answer({"A" => 10, "B" => 10, "C" => 10, "D" => 70 })
   end
 end

# method to increase score by 10
 def increase_score
   @score = @score + 10
 end

# method to randomise and assign probabiliy to choices
 def random_answer(options)
   # assigning the percentages
   totalSize = 0
   options.each do |value, size|
     totalSize = totalSize + size
   end
   # produce a random random from 100
   answer = rand(totalSize)
   # value to assign for probability
   current_stack = 0
   # loop matching the random number with the answer
   options.each do |choice, probability|
     if (answer <= current_stack + probability)
       return choice
     else
       current_stack += probability
     end
   end
   return nil
 end
end
