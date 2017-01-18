class Image < ActiveRecord::Base
  belongs_to :user
  # Using Carrierwave to associate image to Image model and mount_uploader is the method to use
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
  def picture_size
    if picture_size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
