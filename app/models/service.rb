class Service < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :events
  accepts_nested_attributes_for :events
end
#class Event < ActiveRecord::Base
#  has_one :status
#  belongs_to :service
#
#end


#class Machine < ActiveRecord::Base
#   has_many :parts
#   accepts_nested_attributes_for :parts
# end
#
# class Part < ActiveRecord::Base
#   # name:string
#   belongs_to :machine
# end