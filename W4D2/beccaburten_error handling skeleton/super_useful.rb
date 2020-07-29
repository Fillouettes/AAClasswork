# PHASE 2
def convert_to_int(str)
    begin 
      Integer(str)
    rescue ArgumentError => error
      nil
    end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    elsif maybe_fruit == "coffee"
      raise CoffeeError.new("Thanks for the coffee, but I want fruit!")
    else
      raise "That's not a fruit I like >:("
    end
end

class CoffeeError < StandardError #if we give him coffee, try again for a fruit
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => error 
    #raise StandardError  #if its neither fruit nor coffee, bigger error
    puts error.message
    retry
  end 

end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length <= 0
      raise "You don't even know me?"
    else
      @name = name
    end
    if yrs_known < 5
      raise "You're no friend of mine!"
    else
      @yrs_known = yrs_known
    end
    if fav_pastime.length <= 0
      raise "We don't do anything together"
    else
      @fav_pastime = fav_pastime
    end

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known} years!"
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end
