class User < ActiveRecord::Base
  has_many :cupboards
  has_many :products, :through => :closet
end
