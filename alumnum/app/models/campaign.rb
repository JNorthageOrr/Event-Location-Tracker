class Campaign < ActiveRecord::Base
	has_many :images, :dependent => :destroy

	def self.search(search)
        where("name LIKE ? OR city LIKE ?", "%#{search}%", "%#{search}%") 
    end
end

#find(:all, :conditions => ['name ILIKE ?', "%#{search}%"]) || (:all, :conditions => ['city LIKE ?', "%#{search}%"]))