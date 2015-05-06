class Category < ActiveRecord::Base
  include Voteable
  include Sluggable
  
  has_many :post_categories
  has_many :posts, through: :post_categories
  
  validates :name, presence: true, uniqueness: true
  sluggable_column :name
  
end
