class Phone < ActiveRecord::Base
  attr_accessible :number, :type, :contact_id
  belongs_to :contact
end
