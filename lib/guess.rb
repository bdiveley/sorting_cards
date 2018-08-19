require './lib/card'

class Guess
  attr_accessor :response, :card, :value, :suit

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    if card.value == @response.split[0] && card.suit == @response.split[-1]
      true
    end
  end

end
