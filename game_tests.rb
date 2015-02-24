require 'mini_test'

def test_Answer_correct_method
  #add enough data so that test has enough to work with
  DATABASE.execute("INSERT INTO test_answers ")
  a = Answer.correct(2)
  assert_equal()
end