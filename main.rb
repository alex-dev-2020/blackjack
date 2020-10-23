require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "dealer"
require_relative "player"
require_relative "user"
# require_relative "game"

print "Введите Ваше имя: "
player_name = gets.chomp

player = Player.new(player_name)
dealer = Dealer.new

puts "Приветствую, #{player.name}"
puts "Начинаем игру!"

loop do
  abort "На Вашем счету нет денег!" if player.balance.zero?
  abort "На счету Дилера нет денег!" if dealer.balance.zero?

  game = Game.new(player, dealer)

  puts
  puts "=" * 50

  result = game.start

  puts

  if result == 0
    puts "Ничья!"
  elsif result == 1
    puts "Ваш выигрыш!"
  elsif result == 2
    puts "Выиграл Дилер!"
  end

  puts
  puts "Баланс дилера #{dealer.balance} <=> #{player.balance} Баланс игрока"

  puts

  user_input = nil

  until user_input == "да" || user_input == "нет"
    puts "Сыграем еще раз? ( да/нет )"
    user_input = gets.chomp.downcase
  end

  break if user_input == "нет"
end
