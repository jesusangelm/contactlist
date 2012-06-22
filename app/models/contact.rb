class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phones_attributes

  has_many :phones, :dependent => :destroy
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:number].blank? }
end
