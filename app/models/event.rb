class Event < ActiveRecord::Base
  has_one :status
  belongs_to :service

  validates_presence_of :message

end
