# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)      not null
#  password   :string(255)      not null
#  username   :string(255)      not null
#  created_at :timestamptz
#  updated_at :timestamptz
#
# Indexes
#
#  users_email_key     (email) UNIQUE
#  users_username_key  (username) UNIQUE
#
class User < ApplicationRecord
end
