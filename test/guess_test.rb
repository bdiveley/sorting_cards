require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require 'pry'

class GuessTest < Minitest::Test

  def test_new_instance_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_response_instance_variable
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal "10 of Hearts", guess.response
  end

  def test_card_instance_variable
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal card, guess.card
  end

  def test_good_response_correct?
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert guess.correct?
  end

  def test_wrong_response_correct?
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    refute guess.correct?
  end

  def test_good_response_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    guess.correct?

    assert_equal "Correct!", guess.feedback
  end

  def test_wrong_response_feedback
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    guess.correct?

    assert_equal "Incorrect.", guess.feedback
  end

end
