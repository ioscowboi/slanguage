# Public: Card
# A class to get images to display as cards to the player. The location 
# of the images are retreived from the cards table of the slanguage 
# database.
#
# Attributes:
# @id, @location
#
# Methods:
# #initialize, #grab_card
class Card
  attr_accessor :id, :location, :card_id
  
  def initialize(options)
    @id = options["id".to_i]
    @location = options["location".to_i]
    @card_id = options["card_id".to_i]
  end
  
  def self.grab_card(id)
    
    results = DATABASE.execute("SELECT * FROM cards WHERE card_id = #{id}")

    results_as_objects = []
    
    results.each do |r|
      results_as_objects << self.new(r)
    end
    
    results_as_objects
  end
end