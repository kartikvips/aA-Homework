require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:chocolate_cake) {Dessert.new("cake", 1, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(chocolate_cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(chocolate_cake.quantity).to eq(1)
    end

    it "starts ingredients as an empty array" do
      expect(chocolate_cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "blah", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      chocolate_cake.add_ingredient("whipping cream")
      expect(chocolate_cake.ingredients).to eq(["whipping cream"])
    end
  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
      chocolate_cake.add_ingredient("whipping cream")
      chocolate_cake.add_ingredient("peanuts")
      chocolate_cake.add_ingredient("chocolate")
      expect(chocolate_cake.ingredients).to match_array(["whipping cream", "peanuts", "chocolate"])
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(chocolate_cake.eat(1)).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {chocolate_cake.eat(2)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("The Great Vipul")

      expect(chocolate_cake.serve).to eq("The Great Vipul has made 1 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(chocolate_cake)
      chocolate_cake.make_more
    end
  end
end
