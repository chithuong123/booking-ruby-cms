# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string(255)
#  password     :string(255)
#  phone_number :string(255)
#  role         :string(255)
#  username     :string(255)
#  created_at   :timestamptz      not null
#  updated_at   :timestamptz      not null
#
# Indexes
#
#  unique_email_constraint  (email) UNIQUE
#
class User < ApplicationRecord
end
