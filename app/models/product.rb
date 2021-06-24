require_relative 'price_rules.rb'

class Product < ApplicationRecord

  def self.my_cart(params)
    my_cart_hash = {}
    h_creator = one_to_split(params[:cart]).sort.uniq
    h_creator.each do |one_ref|
      my_cart_hash[one_ref] = 0
    end
    my_cart_tab = one_to_split(params[:cart])
    my_cart_tab.each do |one_product|
      if Product.where(description: one_product)
        my_cart_hash[one_product] = my_cart_hash[one_product] + 1
      end
    end
    the_final_bill = []
    my_cart_hash.map do |one_elem|
        if params[one_elem[0]] == "One Bought, One Offer"
          the_final_bill << Price_rules.buy_one_get_one(Product.where(description: one_elem[0]).map{|prod| prod.price}.uniq[0], one_elem[1]).round(2)
        end
        if params[one_elem[0]] == "10% Reduction"
         the_final_bill << Price_rules.reduce_ten_percent_if_buy_more_than_3(Product.where(description: one_elem[0]).map{|prod| prod.price}.uniq[0], one_elem[1]).round(2)
        end
        if params[one_elem[0]] == "Third price reduction"
          the_final_bill << Price_rules.reduce_price_a_third_on_buy(Product.where(description: one_elem[0]).map{|prod| prod.price}.uniq[0], one_elem[1]).round(2)
        end
        if params[one_elem[0]] == "No reduce"
          the_final_bill << Price_rules.return_price_without_price_rules(Product.where(description: one_elem[0]).map{|prod| prod.price}.uniq[0], one_elem[1]).round(2)
        end
    end
    the_final_bill.reduce(:+)
  end

  private

  def self.one_to_split(my_array)
    if my_array != nil
      my_array = my_array[0].split(",")
    end
    my_array
  end

end
