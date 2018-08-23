class Deck
  attr_accessor :cards,
                :suit,
                :value

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort
    (cards.count * 2).times do
    sort_one_round
    end
    return cards
  end

  def sort_one_round
    index_1 = 0
    index_2 = 1
    while index_2 < cards.count
      if cards[index_1].values_to_numbers.to_i > cards[index_2].values_to_numbers.to_i ||
        cards[index_1].values_to_numbers.to_i == cards[index_2].values_to_numbers.to_i && cards[index_1].suits_to_numbers.to_i > cards[index_2].suits_to_numbers.to_i

        cards[index_1], cards[index_2] = cards[index_2], cards[index_1]
      end
      index_1 += 1
      index_2 += 1
    end
    return cards
  end

end
