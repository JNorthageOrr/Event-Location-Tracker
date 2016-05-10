class Image < ActiveRecord::Base
	belongs_to :campaign

	has_attached_file :avatar, styles: {large: "600x600", medium: "300x300", thumb: "150x150"}
  #to Refresh thumbnails, if styles change: rake paperclip:refresh:thumbnails CLASS=User
  #perform file validation
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  #save Latitude and Longitude after file is uploaded, validated
  after_post_process :save_latlong
  #perform no validations
  #do_not_validate_attachment_file_type :avatar
  def save_latlong
      #exif_data = MiniExiftool.new(image.queued_for_write[:original].path)
      #binding.pry
      if (latlon = EXIFR::JPEG.new(avatar.queued_for_write[:original].path).gps?)
        #EXIFR::JPEG.new('enkhuizen.jpg').gps.latitude
        lat = EXIFR::JPEG.new(avatar.queued_for_write[:original].path).gps[0]
        long = EXIFR::JPEG.new(avatar.queued_for_write[:original].path).gps[1]
      #exif = EXIFR::JPEG.new(avatar.queued_for_write[:original].path)
        self.latitude = lat
        self.longitude = long
        #binding.pry
      else
      #rescue
      #  false
        self.latitude = nil
        self.longitude = nil
      end
  end 



end

#has_attached_file :avatar,
#    :path => ":rails_root/public/images/:id/:filename",
#      :url  => "/images/:id/:filename",
#      :styles => {
#        :large => "600x600>", 
#        :medium => "300x300>", 
#        :thumb => "150x150#"}