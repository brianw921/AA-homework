require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
#let is an addl obj to interact with your subject
  subject(:dessert) {Dessert.new("puffpastry", 7, chef)}
  
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('puffpastry')
    end
      
    it "sets a quantity" do
      expect(dessert.quantity).to eq(7)
    end
    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to eq([]) 
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("puffpastry", "tons", chef)}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.add_ingredient("flower")).to eq(["flower"])
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
     
      expect(dessert.mix!).to receive(:shuffle!)
      dessert.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(7)
      expect(dessert.quantity).to eq(0)
    end
      it "raises an error if the amount is greater than the quantity" do 
      expect { dessert.eat(120) }.to raise_error("you don't have money")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Brian the Great Baker")
      expect(dessert.serve).to eq("Chef Brian the Great Baker has made 7 puffpastries!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
