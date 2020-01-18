class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  before_save(:titleize_product)
  # scope :search, -> (product_parameter) { where("name like ?", "%#{product_parameter}%")}
  scope :buy_usa, -> { where(country_of_origin: "USA") }
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  # scope :most_reviews, -> {( ??? )}

  private
  def titleize_product
    self.name = self.name.titleize
  end

end
