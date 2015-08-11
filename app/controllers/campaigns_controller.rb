class CampaignsController < ApplicationController
  
  layout 'client'
  
  def index
    @campaigns = Campaign.order("campaign_start_date DESC")
  end
  
  def show
    @campaign = Campaign.find(params[:id])
  end
  
  def new
    # session[:campaign_params] ||= {}
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.new(campaign_params)
    
    if @campaign.save
      # redirect_to campaign_builder_path(:id => "advocate_offer", :campaign_id => @campaign.id)
      flash[:notice] = "Campaign created successfully."
      redirect_to(:action => 'index')
    else
      render 'new'
    end
  end
    
  private

    def campaign_params
      # same as using "params[:campaign]", except that it:
      # - raises an error if :campaign is not present
      # - allows listed attributes to be mass-assigned
      params.require(:campaign).permit( :campaign_name, :campaign_description, :campaign_start_date, :campaign_end_date, :advocate_offer_type, :advocate_min_purchase, :advocate_review_period, :referral_code_limit, :friend_offer_type, :friend_min_purchase) 
                                       
    end    
     
end
