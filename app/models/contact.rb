class Contact < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # - Attributes Whitelist - #
  attr_accessible :address, :email, :name, :phones_attributes

  # - Relationships - #
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones,
    reject_if: lambda { |a| a[:number].blank? }

  validates :name, presence: true, length: { maximum: 40 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
