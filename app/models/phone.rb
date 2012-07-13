class Phone < ActiveRecord::Base
  TYPES = %w[Home Office Mobile Fax Work]

  # - Relationships - #
  belongs_to :contact

  # - Attributes whitelist - #
  attr_accessible :number, :phone_type, :contact_id
end