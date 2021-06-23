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
          green_tea_total_price = green_tea_return_total_price(Product.first.price, my_cart_hash[:GR1], true)
        else
          green_tea_total_price = green_tea_return_total_price(Product.first.price, my_cart_hash[:GR1], false)
        end
        if params[:Strawberry_promotion_name]
          strawberry_total_price = strawberry_return_total_price(Product.second.price, my_cart_hash[:SR1], true)
        else
          strawberry_total_price = strawberry_return_total_price(Product.second.price, my_cart_hash[:SR1], false)
        end
        if params[:Coffe_promotion_name]
          my_coffe_total_price = my_coffe_return_total_price(Product.third.price, my_cart_hash[:CF1], true)
        else
          my_coffe_total_price = my_coffe_return_total_price(Product.third.price, my_cart_hash[:CF1], false)
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

      def self.green_tea_return_total_price(my_price, my_quantity, is_active)
        my_price, my_quantity = my_price.to_f,  my_quantity.to_i
        is_active ? green_tea_promotion(my_price, my_quantity).round(2) : (my_price * my_quantity).round(2)
      end

      def self.strawberry_return_total_price(my_price, my_quantity, is_active)
        my_price, my_quantity = my_price.to_f, my_quantity.to_i
        is_active ? strawberry_promotion(my_price, my_quantity).round(2) : (my_price * my_quantity).round(2)
      end

      def self.my_coffe_return_total_price(my_price, my_quantity, is_active)
        my_price, my_quantity = my_price.to_f, my_quantity.to_i
        is_active ? coffe_promotion(my_price, my_quantity).round(2) : (my_price * my_quantity).round(2)
      end

      def self.green_tea_promotion(my_price, my_quantity)
        my_price, my_quantity = my_price.to_f, my_quantity.to_i
        my_unit_price = my_price
        my_quantity.even? ? my_price = my_quantity / 2 * my_price : my_price = (((my_quantity - 1) / 2) * my_price) + my_unit_price
        my_price
      end

      def self.strawberry_promotion(my_price, my_quantity)
        my_price, my_quantity = my_price.to_f, my_quantity.to_i
        my_quantity >= 3 ? 4.50 * my_quantity : my_price * my_quantity
      end

      def self.coffe_promotion(my_price, my_quantity)
        my_quantity >= 3 ? (my_price * my_quantity / 3 * 2).round(2) : my_price * my_quantity
      end

end
