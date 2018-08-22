require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require 'pry'

class CardClassTest < Minitest::Test

  def test_new_instance_exists
    card = Card.new("Ace", "Spades")
    assert_instance_of Card, card
  end

  def test_value
    card = Card.new("Ace", "Spades")

    assert_equal "Ace", card.value
  end

  def test_suit
    card = Card.new("Ace", "Spades")

    assert_equal "Spades", card.suit
  end

  def test_value_converted_to_a_number
    card = Card.new("Jack", "Spades")

    assert_equal 11, card.values_to_numbers
  end

  def test_suit_converted_to_a_number
    card = Card.new("Ace", "Spades")

    assert_equal 4 , card.suits_to_numbers
  end

end
