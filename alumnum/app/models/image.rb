class Image < ActiveRecord::Base
	belongs_to :campaign

	has_attached_file :avatar,
		:path => ":rails_root/public/images/:id/:filename",
    	:url  => "/images/:id/:filename",
    	:styles => {
    		:large => "600x600>", 
    		:medium => "300x300>", 
    		:thumb => "150x150#"}
  #to Refresh thumbnails, if styles change: rake paperclip:refresh:thumbnails CLASS=User
  #perform file validation
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  #save Latitude and Longitude after file is uploaded, validated
  after_post_process :save_latlong
  #perform no validations
  #do_not_validate_attachment_file_type :avatar
  def save_latlong
      #exif_data = MiniExiftool.new(image.queued_for_write[:original].path)
      lat = EXIFR::JPEG.new(avatar.queued_for_write[:original].path).gps.latitude
      long = EXIFR::JPEG.new(avatar.queued_for_write[:original].path).gps.longitude
      self.latitude = lat
      self.longitude = long
  end 



end
