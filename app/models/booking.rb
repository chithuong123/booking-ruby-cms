# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  address      :string(255)
#  booking_date :timestamptz
#  event_date   :timestamptz
#  status       :string(255)
#  total_price  :decimal(, )
#  created_at   :timestamptz      not null
#  updated_at   :timestamptz      not null
#  agency_id    :integer
#  service_id   :integer
#  user_id      :integer
#  venue_id     :integer
#
class Booking < ActiveRecord::Base
  belongs_to :service
end
