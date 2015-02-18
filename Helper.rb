class Helper
  attr_accessor :id_picker, :good_choice, :bad_choice, :return_value
  
  
  
  def randomizer
    right_choice = @good_choice
    wrong_choice = @bad_choice
    
    results_as_objects = []
    
    wrong_choice.each do |r|
      results_as_objects << r["text"]
    end
    
    results_as_objects
    @randomizer
  end
end