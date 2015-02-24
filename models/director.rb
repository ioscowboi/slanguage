class Director

  attr_reader :their_answer

  def initialize(options)
    @their_answer = options["answer"]
    @game_count = options["game_count"]
    @lost = options["losses"]
  end

  def direct
    if @their_answer.to_i == 1
      @game_count += 1
      if @game_count >= 5
        redirect to ("/winner")
      end
      redirect to ("/correct")
    else
      @lost += 1
      if @lost >= 3
        redirect to ("/game_over")
      end
      redirect to ("/try_again")
    end
  end
end

