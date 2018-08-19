require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_instance_of_card_class
    card = Card.new("Ace", "Spades")
    assert_instance_of Card, card
  end 

end
