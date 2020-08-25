class Card
  attr_reader :suit, :card, :points

  def initialize(suit, card)
    @suit = suit
    @card = card
    @points = card_points
  end

  def show
    "#{@card} -> #{@suit}"
  end

  private

  def card_points
    return 11 if @card == "A"
    return 10 if ["J", "Q", "K"].include?(@card)
    @card
  end
end
