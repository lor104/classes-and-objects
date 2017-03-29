# INSTRUCTIONS
# Back before the Internet existed, people used to have newspapers delivered to their homes. It was so popular that one of the earliest video games was based on making sure you delivered papers to every house in a suburban neighbourhood.
#
# Let's see if we can make a class that represents a paperboy and get them to deliver all of their papers on time!
#
# Start a new project (create a new subfolder) and add a new file called "paperboy.rb". Run your program and commit your work after each step.
#
# Each paperboy should have several attributes:
#
# Name
# Experience (the number of papers they've delivered)
# Earnings (amount of money they've earned)
# This needs to be read-only!
# Every day, each paperboy is given a house number to start at and a house number to finish at. They get paid $0.25 for every paper they deliver and $0.50 for every paper over their quota. If at the end of the day they haven't met their quota, they lose $2.
#
# The minimum number of papers to deliver is 50. The quota is calculated as half of your experience added to the minimum. So the first time a paperboy makes a delivery, the quota is 50. The next time, the quote is 50 plus half the number of papers that the paperboy has delivered in the past. In this way the quota should increase after every delivery the paperboy makes.
#
# Each paperboy should have at least these methods:
#
# quota
# This method should calculate and return the paperboy's quota for his next delivery
# deliver(start_address, end_address)
# This method will take two house numbers and return the amount of money earned on this delivery as a floating point number. It should also update the paperboy's experience!
# Let's assume that the start_address is always a smaller number than the end_address
# As a stretch exercise you can figure out how to ensure it still works if the above assumption isn't met!

class Paperboy

attr_writer :earnings
attr_accessor :experience

  def initialize(name)
    @name = name
    @experience = 0
    @earnings = 0 #make read only
    @quota = (@experience/2) + 50
  end

  def quota
    @quota = (@experience/2) + 50
  end

  def deliver(house1, house2)
    papers = house2 - house1
    if papers < 50
      @earnings += papers*0.25
    else
      @earnings = @earnings + 12.5 + ((papers-50)*0.5)
    end
    @experience = papers + @experience
    quota
    if papers < @quota
      @earnings = @earnings - 2
    end
  end

  def report
    "I'm #{@name}, I've delivered #{@experience} papers and I've earned $#{@earnings} so far!"
  end

end

josh = Paperboy.new("Josh")

#0.25 per paper delivered
#0.5 per paper over quota
#minimum papers per day = 50
#if at end of day they havent delivered quota, they lose $2
#quota = expereince/2 + minimum

# report
# This method should return a string about the paperboy's performance
# e.g. "I'm Tommy, I've delivered 90 papers and I've earned $38.25 so far!"
# Here's some sample code, using your Paperboy class:
