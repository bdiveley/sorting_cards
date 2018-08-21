require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card'
require './lib/guess'
require './lib/deck'
require 'pry'

class RoundTest < Minitest::Test

  def test_new_instance_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_instance_variables
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
    assert_equal [], round.guesses
    assert_equal card_1, round.current_card
  end

  def test_record_guess_creates_a_guess_object
    card_1 = Card.new("3","Hearts")
    deck = Deck.new([card_1])
    round = Round.new(deck)
    actual = round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, actual
  end

  def test_record_guess_holds_current_card
    card_1 = Card.new("3","Hearts")
    deck = Deck.new([card_1])
    round = Round.new(deck)
    actual = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal card_1, actual.card
  end

  def test_guesses_count
    card_1 = Card.new("3","Hearts")
    deck = Deck.new([card_1])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.guesses.count
  end

  def test_first_guess_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.correct?
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_number_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.correct?
    round.guesses.first.feedback
    round.number_correct
    assert_equal 1, round.num_correct
  end

  def test_move_to_next_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal card_2, round.move_to_next_card
  end

  def test_record_second_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.move_to_next_card
    actual = round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_instance_of Guess, actual
  end

  def test_guesses_count_two
    card_1 = Card.new("3","Hearts")
    deck = Deck.new([card_1])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, round.guesses.count
  end

  def test_second_guess_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.correct?
    round.guesses.first.feedback
    round.number_correct
    round.move_to_next_card
    round.record_guess({value: "Jack", suit: "Diamonds"})
    round.guesses.last.correct?
    binding.pry
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_second_guess_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.correct?
    round.guesses.first.feedback
    round.number_correct
    round.move_to_next_card
    round.record_guess({value: "Jack", suit: "Diamonds"})
    round.guesses.last.correct?
    round.guesses.last.feedback
    round.number_correct
    assert_equal 1, round.num_correct
  end

  def test_second_guess_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.correct?
    round.guesses.first.feedback
    round.number_correct
    round.move_to_next_card
    round.record_guess({value: "Jack", suit: "Diamonds"})
    round.guesses.last.correct?
    round.guesses.last.feedback
    round.number_correct
    assert_equal 50, round.percent_correct
  end

end
