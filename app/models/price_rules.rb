class Price_rules

  def self.return_price_without_price_rules(my_price, my_quantity)
    (my_price.to_f * my_quantity.to_i).to_f
  end

  def self.buy_one_get_one(my_price, my_quantity)
    my_price, my_quantity, my_unit_price = my_price.to_f, my_quantity.to_i, my_price.to_f
    my_quantity.even? ? my_quantity / 2 * my_price : (((my_quantity - 1) / 2) * my_price) + my_unit_price
  end

  def self.reduce_ten_percent_if_buy_more_than_3(my_price, my_quantity)
    my_price, my_quantity = my_price.to_f, my_quantity.to_i
    my_quantity >= 3 ? (my_price - (my_price * 0.1)) * my_quantity : (my_price * my_quantity).round(2)
  end

  def self.reduce_price_a_third_on_buy(my_price, my_quantity)
    my_price, my_quantity = my_price.to_f, my_quantity.to_i
    my_quantity >= 3 ? (my_price * my_quantity / 3 * 2).round(2) : (my_price * my_quantity).round(2)
  end

end
