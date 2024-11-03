# == Schema Information
#
# Table name: agencies
#
#  id               :integer          not null, primary key
#  address          :string(255)
#  capacity         :integer
#  description      :text
#  image            :string(255)
#  lobby            :integer
#  name             :string(255)
#  phone_number     :string(255)
#  created_at       :timestamptz
#  updated_at       :timestamptz
#  administrator_id :integer
#  user_id          :integer
#
class Agency < ApplicationRecord
  mount_uploader :image, BackgroundUploader

  has_many :services, dependent: :destroy
end
