class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url
    'https://boostchiropractic.co.nz/wp-content/uploads/2016/09/default-user-img.jpg'
  end
end
