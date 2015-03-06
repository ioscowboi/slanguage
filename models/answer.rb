# Class: Answer
# A class to get answer options to display to the player from the
# answers table of the slanguage database.
#
# Attributes:
# @id             - the key in the database that ties an image location and answer choices to each other
# @text           - a string from the database for either the image location or the answer choice to be displayed on webpage
# @cards_id       - 
# @correct_answer -
#
# Methods:
# #initialize, #bad_choice_generator, #correct, #not_correct,
# #all
class Answer
  attr_reader :id
  attr_accessor :text, :cards_id, :correct_answer
  
  def initialize(options)
    @id = options["id"].to_i
    @text = options["text"]
    @cards_id = options["cards_id"]
    @correct_answer = options["correct_answer"]
  end
  
  # Public: #bad_choice_generator 
    # This class method grabs three (3) bad choices from the database and turns them into an array of objects.
    # 
    # Parameters:
    # id number (integer) chosen by the random number generator
    #
    # Returns:
    # an array of bad answer objects (ex: {"id" => 1, "cards_id" => 10, "text" => "too good to be true"})
    #
    # State Changes:
    # Inserts values into 'categories' table in the database as a new category
    # record.
  
  def self.bad_choice_generator(id_picker)
    malo_choice = self.not_correct(id_picker)
    n = 0
    randomize = []
    while n != 3
      rand = malo_choice.sample
      
      while randomize.include? rand
        rand = malo_choice.sample
      end
      
      randomize.push(rand)
      n += 1
    end
    return randomize
  end
  
  # Class method self.correct retrieves its hash from the database and is stored in results. Based on matching cards_id's. It only receives the
  # correct answer based on the "correct_answer" column value
 # results is then looped through and the self object is passed into
  # 'results_as_objects' as individual array values to ease processing later.
 #self.correct returns the results_as_objects array
  
  def self.correct(id_num)
    
    results = DATABASE.execute("SELECT * FROM answers WHERE cards_id = #{id_num}
                                AND correct_answer = 1")
                                
    results_as_objects = []
    
    results.each do |r|
       results_as_objects << self.new(r)
    end
    
    results_as_objects
  end
  
  # Class method self.notcorrect retrieves its hash from the database and is stored in results. Based on matching cards_id's. It only receives the
  # incorrect answers based on the "correct_answer" column value
 # results is then looped through and the self object is passed into
  # 'results_as_objects' as individual array values to ease processing later.
 #self.notcorrect returns the results_as_objects array
  def self.not_correct(id_num)
    
    results = DATABASE.execute("SELECT * FROM answers WHERE cards_id = #{id_num}
                                AND correct_answer <> 1")
    
    results_as_objects = []
    
    results.each do |r|
      results_as_objects << self.new(r)
    end
    
    results_as_objects
  end
  
  
  def self.all
    
    results = DATABASE.execute("SELECT * FROM answers WHERE cards_id = #{id}")
    
    results_as_objects = []
    
    results.each do |r|
      results_as_objects << self.new(r)
    end
    
    results_as_objects
  end

end