# == Schema Information
#
# Table name: agencies
#
#  id               :integer          not null, primary key
#  address          :string(255)
#  description      :text
#  image            :string
#  name             :string(255)
#  phone_number     :string(255)
#  created_at       :timestamptz      not null
#  updated_at       :timestamptz      not null
#  administrator_id :integer
#  user_id          :integer
#
class Agency < ApplicationRecord
  mount_uploader :image, BackgroundUploader

  has_many :services, dependent: :destroy
end
