class Hand
  def initialize
    @cards = []
  end

  def get_a_card(deck)
    @cards << deck.cards.shift
  end
end
