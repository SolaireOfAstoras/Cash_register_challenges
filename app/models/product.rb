require_relative 'price_rules.rb'

class Product < ApplicationRecord

  def self.my_cart(params)
    my_cart_hash = {}
    split_str_to_arr(params[:cart]).sort.uniq.each{|one_ref| my_cart_hash[one_ref] = 0}
    split_str_to_arr(params[:cart]).each{|one_product| Product.where(description: one_product) ? my_cart_hash[one_product] += 1 : false}
    the_final_bill = Product.apply_pricing_rules(my_cart_hash, params)
  end

  private

  def self.split_str_to_arr(my_array)
    !my_array.nil? ? my_array[0].split(",") : my_array
  end

  def self.get_info_from_product(my_info)
    Product.where(description: my_info).map{|prod| prod.price}.uniq[0]
  end

  def self.apply_pricing_rules(my_cart_hash, params)
    cart_value = []
    h_price= {}
    my_cart_hash.map{|prod| h_price[prod[0]] = Product.get_info_from_product(prod[0])}
    my_cart_hash.map do |prod|
      case params[prod[0]]
        when "One Bought, One Offer" then cart_value << Price_rules.buy_one_get_one(h_price[prod[0]], prod[1]).round(2)
        when "10% Reduction" then cart_value << Price_rules.reduce_ten_percent_if_buy_more_than_3(h_price[prod[0]], prod[1]).round(2)
        when "Third price reduction" then cart_value << Price_rules.reduce_price_a_third_on_buy(h_price[prod[0]], prod[1]).round(2)
        when "No reduce" then cart_value << Price_rules.return_price_without_price_rules(h_price[prod[0]], prod[1]).round(2)
      end
    end
    cart_value.reduce(:+).round(2)
  end

end
