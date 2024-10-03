# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  booking_date :timestamptz
#  event_date   :timestamptz
#  status       :string(255)
#  total_price  :decimal(, )
#  created_at   :timestamptz
#  updated_at   :timestamptz
#  agency_id    :integer
#  service_id   :integer
#  user_id      :integer
#  venue_id     :integer
#
class Booking < ActiveRecord::Base
  belongs_to :service
end
