class Card
  attr_accessor :value, :suit, :suit_dictionary

  def initialize(value, suit)
    @value = value
    @suit = suit
    @suit_dictionary = {"Jack":11, "Queen":12, "King":13, "Ace":14, "Clubs":1, "Diamonds":2, "Hearts":3, "Spades":4}
  end

  def values_to_numbers
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
      if suit == "Clubs"
        suit_dictionary.values[4]
      elsif suit == "Diamonds"
        suit_dictionary.values[5]
      elsif suit == "Hearts"
        suit_dictionary.values[6]
      elsif suit == "Spades"
        suit_dictionary.values[7]
      else
        suit
      end
  end
end
