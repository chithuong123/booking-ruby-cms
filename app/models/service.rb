# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :text             not null
#  images      :json
#  name        :string(255)      not null
#  price       :float            not null
#  created_at  :timestamptz
#  updated_at  :timestamptz
#  agency_id   :integer
#
# Foreign Keys
#
#  services_agency_id_fkey  (agency_id => agencies.id) ON DELETE => nullify ON UPDATE => cascade
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
