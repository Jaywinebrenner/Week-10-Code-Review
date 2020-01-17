require 'rails_helper'

describe Product do
  it("titleizes the name of an product") do
    product = Product.create({name: "rat milk", cost: "20", country_of_origin: "Bulgaria"})
    expect(product.name()).to(eq("Rat Milk"))
  end

  it { should have_many(:reviews) }
  it { should validate_presence_of :name }

end
