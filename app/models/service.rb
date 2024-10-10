# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :text
#  images      :json
#  name        :string(255)
#  price       :decimal(, )
#  created_at  :timestamptz      not null
#  updated_at  :timestamptz      not null
#  agency_id   :integer
#
class Service < ApplicationRecord
  mount_uploaders :images, ImageUploader

  after_save :update_image_paths

  has_one :booking, dependent: :destroy
  belongs_to :agency, dependent: :destroy

  private

  def update_image_paths
    if saved_change_to_id?
      images.each do |image|
        image.recreate_versions!
      end
    end
  end
end
