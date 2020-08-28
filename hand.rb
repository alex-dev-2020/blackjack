class Hand
  BLACKJACK = 21

  attr_reader :cards

  def initialize
    @cards = []
  end

  def get_a_card(deck)
    @cards << deck.cards.shift
  end

  def cards_count
    @cards.count
  end

  def show_cards
    # 'cause index starts from 0
    @cards.each_with_index do |card, index|
      puts "#{index + 1}: #{card.show}"
    end
  end

  # points scoring
  def points
    point = 0

    @cards.each do |card|
      if card.card == "A"
        point += ace_point(point, card.points)
      else
        point += card.points
      end
    end
    point
  end

  # ace point scoring
  def ace_point(point, card_value)
    if point + card_value <= BLACKJACK
      ace_value = card_value
    else
      ace_value = 1
    end
    ace_value
  end
end
