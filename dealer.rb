require_relative 'user'

class Dealer < User
  def initialize
    @name = 'Дилер'
    super()
  end
end
