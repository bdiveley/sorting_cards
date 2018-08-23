class Card
  attr_accessor :value,
                :suit,
                :suit_dictionary

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def values_to_numbers
    suit_dictionary = {"Jack":11, "Queen":12, "King":13, "Ace":14}
    if value == "Ace"
      suit_dictionary.values[3]
    elsif value == "King"
      suit_dictionary.values[2]
    elsif value == "Queen"
      suit_dictionary.values[1]
    elsif value == "Jack"
      suit_dictionary.values[0]
    else
      value
    end
  end

  def suits_to_numbers
    suit_dictionary = {"Clubs":1, "Diamonds":2, "Hearts":3, "Spades":4}
    if suit == "Clubs"
      suit_dictionary.values[0]
    elsif suit == "Diamonds"
      suit_dictionary.values[1]
    elsif suit == "Hearts"
      suit_dictionary.values[2]
    elsif suit == "Spades"
      suit_dictionary.values[3]
    else
      suit
    end
  end
end
