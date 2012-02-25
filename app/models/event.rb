class Event < ActiveRecord::Base
  has_one :status
  belongs_to :service

end
