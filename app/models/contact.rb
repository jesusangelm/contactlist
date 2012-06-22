class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name

  has_many :phones
end
