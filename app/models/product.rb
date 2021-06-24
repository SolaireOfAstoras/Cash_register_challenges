require_relative 'price_rules.rb'

class Product < ApplicationRecord

  def self.my_cart(params)
    my_cart_hash = {}
    h_creator = one_to_split(params[:cart]).sort.uniq.each{|one_ref| my_cart_hash[one_ref] = 0}
    one_to_split(params[:cart]).each{|one_product| Product.where(description: one_product) ? my_cart_hash[one_product] += 1 : false}
    the_final_bill = Product.apply_pricing_rules(my_cart_hash, params)
  end

  private

  def self.one_to_split(my_array)
    !my_array.nil? ? my_array[0].split(",") : my_array
  end

  def self.get_info_from_product(my_info)
    Product.where(description: my_info).map{|prod| prod.price}.uniq[0]
  end

  def self.apply_pricing_rules(my_cart_hash, params)
    the_final_bill = []
    my_cart_hash.map do |one_elem|
      case params[one_elem[0]]
        when "One Bought, One Offer"
          the_final_bill << Price_rules.buy_one_get_one(Product.get_info_from_product(one_elem[0]), one_elem[1]).round(2)
        when "10% Reduction"
          the_final_bill << Price_rules.reduce_ten_percent_if_buy_more_than_3(Product.get_info_from_product(one_elem[0]), one_elem[1]).round(2)
        when "Third price reduction"
          the_final_bill << Price_rules.reduce_price_a_third_on_buy(Product.get_info_from_product(one_elem[0]), one_elem[1]).round(2)
        when "No reduce"
          the_final_bill << Price_rules.return_price_without_price_rules(Product.get_info_from_product(one_elem[0]), one_elem[1]).round(2)
        end
      end
    the_final_bill.reduce(:+).round(2)
  end

end
