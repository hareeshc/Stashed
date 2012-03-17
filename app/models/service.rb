class Service < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :events, :dependent => :destroy
  accepts_nested_attributes_for :events

  def get_all_statuses
    statuses.select("events.id, events.message, events.created_at, statuses.image").order("events.created_at DESC")
    
  end #, :allow_destroy => true
end


#class Question < ActiveRecord::Base
#  belongs_to :survey
#end
#class Survey < ActiveRecord::Base
#    has_many :questions, :dependent => :destroy
#    accepts_nested_attributes_for :questions
#end
#
#- form_for @survey do |f|
#  = f.error_messages
#  %p
#    = f.label :name
#    %br/
#    = f.text_field :name
#  - f.fields_for :questions do |builder|
#    %p
#      = builder.label :content, "Question"
#      %br/
#      = builder.text_area :content, :rows => 3
#  %p= f.submit "Submit"