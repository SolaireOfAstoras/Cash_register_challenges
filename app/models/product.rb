require_relative 'price_rules.rb'

class Product < ApplicationRecord

  def self.my_cart(params)
    my_cart_hash = {
      GR1: 0,
      SR1: 0,
      CF1: 0
    }
    my_cart_tab = one_to_split(params[:cart])
    my_cart_tab.each do |one_product|
      if one_product == "GR1"
    my_cart_hash[:GR1] = my_cart_hash[:GR1] + 1
      end
      if one_product == "SR1"
    my_cart_hash[:SR1] = my_cart_hash[:SR1] + 1
      end
      if one_product == "CF1"
    my_cart_hash[:CF1] = my_cart_hash[:CF1] + 1
      end
    end
    if params[:Green_tea_promotion_name]
      green_tea_total_price = Price_rules.buy_one_get_one(Product.first.price, my_cart_hash[:GR1])
    else
      green_tea_total_price = Price_rules.return_price_without_price_rules(Product.first.price, my_cart_hash[:GR1])
    end
    if params[:Strawberry_promotion_name]
      strawberry_total_price = Price_rules.reduce_ten_percent_if_buy_more_than_3(Product.second.price, my_cart_hash[:SR1])
    else
      strawberry_total_price = Price_rules.return_price_without_price_rules(Product.second.price, my_cart_hash[:SR1])
    end
    if params[:Coffe_promotion_name]
      my_coffe_total_price = Price_rules.reduce_price_a_third_on_buy(Product.third.price, my_cart_hash[:CF1])
    else
      my_coffe_total_price = Price_rules.return_price_without_price_rules(Product.third.price, my_cart_hash[:CF1])
    end
    "The Bill: #{(green_tea_total_price + strawberry_total_price + my_coffe_total_price).round(2)}"
  end

  private

  def self.one_to_split(my_array)
    if my_array != nil
    my_array = my_array[0].split(",")
    end
    my_array
  end

end
