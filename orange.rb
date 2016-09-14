
# This is how you define your own custom exception classes

require 'byebug'

class NoOrangesError < StandardError
end

class OrangeTree
  attr_reader :age, :height, :oranges

  def initialize
    @age = 0
    @height = 0
    @oranges = 0
  end


# Ages the tree one year
  def age!
    @age += 1
    @height += 0.7 unless @age > 8
    puts "The tree is #{@age} years old and #{@height.floor} meters tall."
  end

# Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?

    if @age.between?(7,9)
      @oranges = rand(5..8)
      return true
    elsif @age.between?(5,6)
      @oranges = rand(3..4)
      return true
    elsif @age.between?(3,4)
      @oranges = rand(1..2)
      return true
    elsif @age < 3
      return false
    elsif @age >= 10
      return false
    end
  end

# Returns an Orange if there are any
# Raises a NoOrangesError otherwise
    def pick_an_orange!
     
      if !self.any_oranges?
        puts "This tree has no oranges"
        @basket = []
      else
        @basket = []
        # orange-picking logic goes here
        @oranges.times do @basket << Orange.new.instance_variable_get(:@diameter)
        end
      end
      puts "Plucked oranges! => #{@basket.inspect}"
    end

    def dead?
      if age == 12
        puts "The tree has died!"
        return true
      end
    end
  end

  class Orange
    attr_reader :diameter

    def initialize
      @diameter = rand(1..10)
    end
  end

tree = OrangeTree.new
  until tree.dead?
 
  tree.any_oranges?
  tree.pick_an_orange!

  sleep(1)

  tree.age!
  end

