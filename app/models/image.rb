class Image < ActiveRecord::Base
  attr_accessible :url, :remote_url_url

  belongs_to :imageable, polymorphic: true

  mount_uploader :url, PostImagesUploader
end
