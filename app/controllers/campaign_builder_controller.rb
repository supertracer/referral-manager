class CampaignBuilderController < ApplicationController
  
  include Wicked::Wizard
  
  steps :advocate_offer, :friend_offer
  
  def show
    @campaign = Campaign.find(params[:campaign_id])
    render_wizard
    
  end
  
  
  def update
    puts "=================================="
    puts params
    puts "=================================="
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes(campaign_params)
    render_wizard @campaign
    
    
    # session[:campaign_params].deep_merge!(campaign_params) if campaign_params
    # @campaign = Campaign.new(session[:campaign_params])
    # # @advocate_offer = AdvocateOffer.new(advocate_offer_params)
    # # @friend_offer = FriendOffer.new(friend_offer_params)
#     
    # @campaign.current_step = session[:campaign_step]
    # if params[:previous_button]
      # @campaign.previous_step
    # elsif @campaign.last_step?
      # @campaign.save
    # else
      # @campaign.next_step
    # end
    # session[:campaign_step] = @campaign.current_step
    # if @campaign.new_record?
      # render "new"
    # else
      # flash[:notice] = "Campaign created"
      # redirect_to @campaign
    # end
  end
    
  private

    def campaign_params
      # same as using "params[:campaign]", except that it:
      # - raises an error if :campaign is not present
      # - allows listed attributes to be mass-assigned
      params.require(:campaign).permit( :campaign_name, :campaign_description, :campaign_start_date, :campaign_end_date, :advocate_offer_type, :advocate_min_purchse, :advocate_review_period, :referral_code_limit, :friend_offer_type, :friend_min_purchse ) 
                                       
    end  
    
    # def advocate_offer_params
      # # same as using "params[:campaign]", except that it:
      # # - raises an error if :campaign is not present
      # # - allows listed attributes to be mass-assigned
      # params.require(:advocate_offer).permit( :advocate_offer_type, :advocate_start_date, :advocate_end_date, :advocate_min_purchse, :advocate_review_period, :referral_code_limit) 
      #                                        
    # end 
    
    # def friend_offer_params
      # # same as using "params[:campaign]", except that it:
      # # - raises an error if :campaign is not present
      # # - allows listed attributes to be mass-assigned
      # params.require(:friend_offer).permit(:friend_offer_type, :friend_start_date, :friend_end_date, :friend_min_purchse) 
      #                                        
    # end   
    
end
