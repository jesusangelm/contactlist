class Phone < ActiveRecord::Base
  attr_accessible :number, :phone_type, :contact_id
  belongs_to :contact
end
