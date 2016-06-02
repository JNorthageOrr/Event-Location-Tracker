class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
    @recent_campaigns_display = @campaigns.uniq.take(6)
    @campaign_search = Campaign.search(params[:search])
    
    
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @campaigns = Campaign.all
    @recent_campaigns_display = @campaigns.uniq.take(6)
    @images = Image.where(campaign_id: params[:id])
    @campaign = Campaign.find(params[:id])
    @campaign_search = Campaign.search(params[:search])
  end

  # GET /campaigns/new
  def new
    @campaigns = Campaign.all
    @campaign = Campaign.new
    @recent_campaigns_display = @campaigns.take(6)
    #@campaign.build_image
  end

  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
     
        if params[:avatar]
          #===== The magic is here ;)
          params[:avatar].each { |image|
          @campaign.images.create(avatar: image)
        }
        end

        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render json: @campaign, status: :created, location: @campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        if params[:avatar]
          params[:avatar].each { |image| 
            @campaign.images.create(avatar: image)}
        end
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
   
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:name, :city, :image, :avatar)
    end
end
