require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require 'pry'

class DeckTest < Minitest::Test

  def test_instance_of_class
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([Card.new("3","Hearts"), Card.new("4", "Clubs"), Card.new("5", "Diamonds")])
    assert_instance_of Deck, deck
  end

  def test_instance_variable_count
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([Card.new("3","Hearts"), Card.new("4", "Clubs"), Card.new("5", "Diamonds")])
    assert_equal 3, deck.count
  end

  def test_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("19", "Clubs")
    card_3 = Card.new("3", "Diamonds")
    card_4 = Card.new("5", "Spades")
    card_5 = Card.new("1", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    binding.pry
    assert_equal [card_1, card_2], deck.compare_two_elements
  end
end
