class Order

  attr_reader :order, :amount

  def initialize
    @order, @amount = [], []
  end

  def add_to_order dish, quantity
      amount << quantity
      order << dish
  end

  def total_price
    total, count = 0, 0
    order.each do |item|
      total += (item.price * amount[count])
      count += 1
    end
    total
  end

  def show_order
    puts "Your order:\n"
    count = 0
    order.each do |dish|
      quantity = order.count(dish)
      puts "#{dish.show_details} X#{amount[count]}"
      count += 1
    end
  end

  def place_order payment
    fail 'Payment does not match total!' if payment != total_price
    show_order
    total_price
    Text.new.send_text
  end
end
