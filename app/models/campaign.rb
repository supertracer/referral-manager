class Campaign < ActiveRecord::Base
  
  #has_many :customer_campaigns
  belongs_to :advocate_offer 
  belongs_to :friend_offer 
  has_many :customer_campaigns 
  has_many :customers, :through => :customer_campaigns
  
  
  #  belongs_to :advocate_offer 
  # belongs_to :friend_offer 
  
  # attr_writer :current_step
  
  # def steps
    # %w[basic_info advocate_offer friend_offer]
  # end
  
  # def current_step
    # @current_step || steps.first
  # end
#   
  # def next_step
    # self.current_step = steps[steps.index(current_step)+1]
  # end
#   
  # def previous_step
    # self.current_step = steps[steps.index(current_step)-1]
  # end
#   
  # def first_step?
    # current_step == steps.first
  # end
#   
  # def last_step?
    # current_step == steps.last
  # end
  
end
