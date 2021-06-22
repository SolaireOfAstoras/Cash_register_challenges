require_relative "product.rb"

my_product1 = Product.new()
my_product1 = {cart: ["GR1, GR1"], Green_tea_promotion_name: "on", Coffe_promotion_name: "on", Strawberry_promotion_name: "on"}
my_product2 = Product.new()
my_product2 = {cart: ["SR1,SR1,GR1,SR1"], Green_tea_promotion_name: "on", Coffe_promotion_name: "on", Strawberry_promotion_name: "on"}
my_product3 = Product.new()
my_product3 = {cart: ["GR1,CF1,SR1,CF1,CF1"], Green_tea_promotion_name: "on", Coffe_promotion_name: "on", Strawberry_promotion_name: "on"}
my_product4 = Product.new()
my_product4 = {cart: ["GR1,GR1,GR1,GR1,GR1,SR1,SR1,SR1,SR1,SR1,SR1,SR1,SR1,CF1,CF1,CF1,CF1,CF1"], Green_tea_promotion_name: "on", Coffe_promotion_name: "on", Strawberry_promotion_name: "on"}
describe Product do

  describe ".my_cart" do
    context "given an empty string" do
      it "The Bill: 3.11" do
        expect(Product.my_cart(my_product1)).to eq("The Bill: 3.11")
      end
      it "The Bill: 16.61" do
        expect(Product.my_cart(my_product2)).to eq("The Bill: 16.61")
      end
      it "The Bill: 30.57" do
        expect(Product.my_cart(my_product3)).to eq("The Bill: 30.57")
      end
      it "The Bill: 82.76" do
        expect(Product.my_cart(my_product4)).to eq("The Bill: 82.76")
      end
      it "9.33" do
        expect(Product.green_tea_return_total_price("3.11", "5", true)).to eq("9.33".to_f)
      end
      it "9.33" do
        expect(Product.green_tea_return_total_price2("3.11", "5", true)).to eq("9.33".to_f)
      end
      it "15.55" do
        expect(Product.green_tea_return_total_price("3.11", "5", false)).to eq("15.55".to_f)
      end
      it "15.55" do
        expect(Product.green_tea_return_total_price2("3.11", "5", false)).to eq("15.55".to_f)
      end
      it "22.5" do
        expect(Product.strawberry_return_total_price("5.00", "5", true)).to eq("22.5".to_f)
      end
      it "22.5" do
        expect(Product.strawberry_return_total_price2("5.00", "5", true)).to eq("22.5".to_f)
      end
      it "25.0" do
        expect(Product.strawberry_return_total_price("5.00", "5", false)).to eq("25.0".to_f)
      end
      it "25.0" do
        expect(Product.strawberry_return_total_price2("5.00", "5", false)).to eq("25.0".to_f)
      end
      it "37.43" do
        expect(Product.my_coffe_return_total_price("11.23", "5", true)).to eq("37.43".to_f)
      end
      it "37.43" do
        expect(Product.my_coffe_return_total_price2("11.23", "5", true)).to eq("37.43".to_f)
      end
      it "56.15" do
        expect(Product.my_coffe_return_total_price("11.23", "5", false)).to eq("56.15".to_f)
      end
      it "56.15" do
        expect(Product.my_coffe_return_total_price2("11.23", "5", false)).to eq("56.15".to_f)
      end
      it "9.33" do
        expect(Product.green_tea_promotion("3.11", 5)).to eq("9.33".to_f)
      end
      it "9.33" do
        expect(Product.green_tea_promotion2("3.11", 5)).to eq("9.33".to_f)
      end
      it "180" do
        expect(Product.strawberry_promotion("5", "40")).to eq("180".to_f)
      end
      it "180" do
        expect(Product.strawberry_promotion2("5", "40")).to eq("180".to_f)
      end
    end
  end
p Product.my_cart(my_product4)
end
