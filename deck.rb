require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  protected

  def create_deck
    cards = []
    %w(♠ ♣ ♥ ♦).each do |suit|
      (2..10).each do |number|
        cards << Card.new(suit, number)
      end

      %w(A K Q J).each do |facecard|
        cards << Card.new(suit, facecard)
      end
    end
    cards.shuffle!
  end
end
