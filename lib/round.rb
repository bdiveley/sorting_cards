class Round
  attr_accessor :deck,
                :guesses,
                :current_card,
                :num_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = deck.cards[0]
    @num_correct = 0
  end

  def record_guess(guess)
    response = guess.values[0] + " of " + guess.values[1]
    new_guess = Guess.new(response, @current_card)
    @guesses << new_guess

    return new_guess
  end

  def number_correct
    if guesses.last.correct?
      @num_correct += 1
    end
  end

  def move_to_next_card
    @current_card = deck.cards[(@guesses.count)]
  end

  def percent_correct
    correct = (num_correct.to_f / guesses.count) * 100
    correct.round
  end

end
