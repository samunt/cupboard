class Product < ActiveRecord::Base
  belongs_to :closet
  has_one :palette
end
