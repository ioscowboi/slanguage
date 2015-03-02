require 'minitest/autorun'
require_relative 'main.rb'

class Game_Test < Minitest::Test

# make sure card id matches the correct id# requested

def test_card_id
  @random = rand(1..10).to_i

  @id_num = Card.grab_card(@random)
  @correcto = Answer.correct(@random)

  assert_equal @correcto[0].cards_id, @id_num[0].card_id
end

end