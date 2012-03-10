class Service < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :events
  accepts_nested_attributes_for :events
end
