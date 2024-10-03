class BackgroundUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def store_dir
    if model.id
      "agencies/#{model.id}"
    else
      "tmp/uploads/#{SecureRandom.uuid}"
    end
  end

  def public_id
    if model.id
      "agencies/#{model.id}/#{mounted_as}"
    else
      "tmp/uploads/#{SecureRandom.uuid}/#{mounted_as}"
    end
  end
end
