class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phones_attributes

  has_many :phones, :dependent => :destroy
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:number].blank? }

  validates :name, presence: true, length: { maximum: 40 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with:  VALID_EMAIL_REGEX }
end
