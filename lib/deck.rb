class Deck
  attr_accessor :cards, :suit, :value, :sorted

  def initialize(cards)
    @cards = cards
    @sorted = []
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
    return @cards
  end

  def swap(index_1, index_2)
    if compare_two_elements(index_1, index_2)
        cards[index_1], cards[index_2] = cards[index_2], cards[index_1]
        return cards[index_1]
      else
        return cards[index_1]
    end
  end

  def compare_two_elements(index_1, index_2)
      cards[index_1].value.to_i > cards[index_2].value.to_i
  end
end
