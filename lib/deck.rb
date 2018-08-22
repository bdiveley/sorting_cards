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
    index_1 = 0
    index_2 = 1
    result = compare_two_cards(index_1, index_2)
    next_card = swap(result)
    sorting = one_sort(next_card)
    sort_all(sorting)
  end

  def sort_all(sorting)
    (cards.count * 2).times do
    sorting
    end
    return cards
  end

  def one_sort(next_card)
    index_1 = 0
    index_2 = 1
    while index_2 < cards.count
      next_card
      index_1 += 1
      index_2 += 1
    end
    return cards
  end

  def swap(result)
    if result
      cards[index_1], cards[index_2] = cards[index_2], cards[index_1]
    end
    return cards[index_1]
  end

  def compare_two_cards(index_1, index_2)
    if cards[index_1].values_to_numbers.to_i > cards[index_2].values_to_numbers.to_i
      return true
    elsif
      cards[index_1].values_to_numbers.to_i == cards[index_2].values_to_numbers.to_i && cards[index_1].suits_to_numbers.to_i > cards[index_2].suits_to_numbers.to_i
      return true
    else
      return false
    end
  end

end
