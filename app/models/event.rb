class Event < ActiveRecord::Base
  has_one :status
  belongs_to :service

  accepts_nested_attributes_for :services

end
