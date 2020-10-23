require_relative "blackjack"

class Game
  include Blackjack

  attr_reader :player, :dealer, :deck

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @deck = Deck.new

    @player.hand = Hand.new
    @dealer.hand = Hand.new

    2.times { @player.hand.get_a_card(@deck) }
    2.times { @dealer.hand.get_a_card(@deck) }
  end

  def start
    if @player.hand.points == BLACKJACK || @dealer.hand.points == BLACKJACK
      show_player_hand
    else
      play()
    end

    puts

    show_dealer_hand
    status = game_status
    calculate_balance(status)
    return status
  end

  def game_status
    player_points = @player.hand.points
    dealer_points = @dealer.hand.points

    if player_points > dealer_points
      status = 1
    elsif player_points == dealer_points
      status = 0
    elsif player_points < dealer_points
      status = 2
    elsif dealer_points > BLACKJACK
      status = 1
    end
    status
  end

  def calculate_balance(status)
    if status == 2
      @player.decrease_balance
      @dealer.increase_balance
    elsif status == 1
      @player.increase_balance
      @dealer.decrease_balance
    end
  end

  def show_player_hand
    puts "Ваши карты:"
    @player.hand.show_cards
    print "Ваши очки: "
    puts @player.hand.points
  end

  def show_dealer_hand
    puts "Карты диллера:"
    @dealer.hand.show_cards
    print "Очки диллера: "
    puts @dealer.hand.points
  end

  def play
    loop do
      show_player_hand

      break if @player.hand.cards_count == MAX_CARDS

      puts
      puts "1 - Пропустить ход"
      puts "2 - Добавить карту"
      puts "3 - Открыть карты"

      choice = gets.to_i

      puts

      step(choice)

      @dealer.hand.get_a_card(deck) if @dealer.hand.points <= EIGHTEEN

      break if choice == 3
    end
  end

  def step(choice)
    case choice
    when 1
      puts "Ход пропущен"
    when 2
      @player.hand.get_a_card(deck)
    when 3
      puts "Открываем карты"
    else
      puts "Неправильный вариант... Выберите еще раз"
      # flag = true
    end
  end
end
