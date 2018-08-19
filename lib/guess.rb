class Guess
  attr_accessor :response, :card, :value, :suit, :correct

  def initialize(response, card)
    @response = response
    @card = card
    @correct = nil
  end

  def correct?
    if card.value == @response.split[0] && card.suit == @response.split[-1]
      @correct = true
    else
      @correct = false
    end
  end

  def feedback
    if @correct
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
