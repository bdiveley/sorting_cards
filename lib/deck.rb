require 'pry'

class Deck
  attr_accessor :cards, :suit, :value

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort
    (cards.count * 2).times do
    one_sort
    end
    return cards
  end

  def one_sort
    index_1 = 0
    index_2 = 1
    while index_2 < cards.count
      swap(index_1, index_2)
      index_1 +=1
      index_2 += 1
    end
    return cards
  end

  def swap(index_1, index_2)
    if compare_two_elements(index_1, index_2)
        cards[index_1], cards[index_2] = cards[index_2], cards[index_1]
        return cards[index_2]
      else
        return cards[index_1]
    end
  end

  def compare_two_elements(index_1, index_2)
      values_to_numbers
      cards[index_1].value.to_i > cards[index_2].value.to_i
      #add what to do if the two values are equal
  end

  def values_to_numbers
    suits_dictionary = {"Jack":11, "Queen":12, "King":13, "Ace":14}
    cards.map do |number|
      if number.value == "Ace"
        number.value = suits_dictionary.values.last
      elsif number.value == "King"
        number.value = suits_dictionary.values[2]
      elsif number.value == "Queen"
        number.value = suits_dictionary.values[1]
      elsif number.value == "Jack"
        number.value = suits_dictionary.values[0]
      else
        number.value
      end
    end
  end

end
