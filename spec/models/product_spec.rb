require 'rails_helper'

describe Product do
  it("titleizes the name of an product") do
    product = Product.create({name: "rat milk", cost: "20", country_of_origin: "Bulgaria"})
    expect(product.name()).to(eq("Rat Milk"))
  end

  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it { should have_many :reviews }
end

describe Product do
  describe '#name' do
    it 'returns the product name' do
      product = Product.new({:name => 'Rat Milk', :cost => 50, :country_of_origin => 'USA', :id => nil})
      expect(product.name).to eq 'Rat Milk'
    end
  end

  context '#id' do
    it 'returns the id of the product before saving product' do
      product = Product.new({:name => 'Rat Milk', :cost => 50, :country_of_origin => 'USA', :id => nil})
      expect(product.id).to eq nil
    end
  end

  it 'returns the id of the product after saving product' do
    product = Product.new({:name => 'Rat Milk', :cost => 50, :country_of_origin => 'USA', :id => nil})
    product.save
    expect(product.id).to be_an_instance_of Integer
  end
end


# describe '#save' do
#   it 'saves a product to the database' do
#     product = Product.new({:name => 'Rat Milk', :cost => 50, :country_of_origin => 'USA', :id => nil})
#     product.save
#     expect(Product.all).to eq [product]
#   end
# end
