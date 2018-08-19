class Round
  attr_accessor :deck, :guesses, :cards, :current_card, :response, :card

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = deck.cards[0]
  end

  def record_guess(guess)
     card = Card.new(guess.values[0], guess.values[1])
     response = guess.values[0] + " of " + guess.values[1]
     guesses << Guess.new(response, card)
  end

  def count
    guesses.count
  end

end
