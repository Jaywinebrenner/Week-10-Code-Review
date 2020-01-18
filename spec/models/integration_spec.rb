require 'rails_helper'
Product.destroy_all
Review.destroy_all
describe 'the product creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a product' do
    visit '/'
    save_and_open_page
    click_link('Create new product')
    fill_in('Name' , :with => 'Rat Milk')
    fill_in('Cost', :with => '100')
    fill_in('Country of origin', :with => '100')
    click_button('Create Product')
    expect(page).to have_content('Rat Milk')
  end
end

describe 'the product update path', {:type => :feature} do
  it 'allows a user to change the name of the product' do
    visit '/'
    click_link('Create new product')
    fill_in('Name' , :with => 'Pig Poppers')
    fill_in('Cost', :with => '100')
    fill_in('Country of origin', :with => '100')
    click_button('Create Product')
    click_link('Pig Poppers')
    click_link('Edit Product')
    fill_in('Name' , :with => 'Chalk Poppers')
    expect(page).to have_content('Chalk Poppers')

  end
end
  #
  # # # A user should be able to nagivate to a product's detail page and delete the product. The user will then be directed to the index page. The product should no longer be on the list of products.
  #
  # describe 'the product delete path', {:type => :feature} do
  #   it 'allows a user to delete a product' do
  #     test_product = Product.new({:title => 'Teaching Kids to Code', :id => nil})
  #     test_product.save
  #     id = test_product.id
  #     visit "/products/#{id}/edit"
  #     click_button('Delete Product')
  #     visit '/'
  #     expect(page).not_to have_content("Teaching Kids to Code")
  #   end
  # end
  # #
  # # # The user should be able to click on a product detail page and see a list of all volunteers working on that product. The user should be able to click on a volunteer to see the volunteer's detail page.
  # #
  # describe 'the volunteer detail page path', {:type => :feature} do
  #   it 'shows a volunteer detail page' do
  #     test_product = Product.new({:title => 'Teaching Kids to Code', :id => nil})
  #     test_product.save
  #     product_id = test_product.id.to_i
  #     test_volunteer = Volunteer.new({:name => 'Jasmine', :product_id => product_id, :id => nil})
  #     test_volunteer.save
  #     visit "/products/#{product_id}"
  #     click_link('Jasmine')
  #     fill_in('name', :with => 'Jane')
  #     click_button('Update Volunteer')
  #     expect(page).to have_content('Jane')
  #   end
  # end
