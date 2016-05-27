class ImagesController < ApplicationController
  before_action :set_image, only: [:edit, :update, :destroy] #removed :show

  def index
    @images = Image.all
    #@image = Image.new
    

  end
  
  #GET /images/1
  #GET /images/1.json
  def show
    @image = Image.find(params[:id])
    #@image_properties = get_image_properties
    @campaigns = Campaign.all
    @recent_campaigns_display = @campaigns.uniq.take(6)
    @campaign_search = Campaign.search(params[:search])
    
  end

  # GET /images/new
  def new
    @image = Image.new
    #@image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      render json: { message: "success", fileID: @image.id }, status: 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def image_params
    params.require(:image).permit(:avatar)
  end

  #def get_image_properties
  #    image_url_broken = @image.avatar.url(:original)
  #    precede_url = "./public"
  #    regexp = /\?\d+$/
  #   image_url_fixed = image_url_broken.sub!(regexp, '')
  #    image_url_final = precede_url + image_url_fixed
  #end

end

  

#   # GET /images
#   # GET /images.json
#   def index
#     @images = Image.all
#   end

#   

#   

#   # GET /images/1/edit
#   def edit
#   end

#   # POST /images
#   # POST /images.json
#   def create
#     @image = Image.new(image_params)

#     respond_to do |format|
#       if @image.save
#         format.html { redirect_to @image, notice: 'Image was successfully created.' }
#         format.json { render :show, status: :created, location: @image }
#       else
#         format.html { render :new }
#         format.json { render json: @image.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /images/1
#   # PATCH/PUT /images/1.json
#   def update
#     respond_to do |format|
#       if @image.update(image_params)
#         format.html { redirect_to @image, notice: 'Image was successfully updated.' }
#         format.json { render :show, status: :ok, location: @image }
#       else
#         format.html { render :edit }
#         format.json { render json: @image.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /images/1
#   # DELETE /images/1.json
#   def destroy
#     @image.destroy
#     respond_to do |format|
#       format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_image
#       @image = Image.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def image_params
#       params.require(:image).permit(:upload_number, :image_url, :image, :attachment)
#     end
# end
