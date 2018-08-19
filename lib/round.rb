class Round
  attr_accessor :deck, :guesses, :cards, :current_card

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = deck.cards[0]
  end

end
