# == Schema Information
#
# Table name: administrators
#
#  id                        :bigint           not null, primary key
#  email                     :string
#  first_name                :string
#  last_name                 :string
#  password_digest           :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  role                      :integer          default("agency")
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  agency_id                 :integer
#
require "test_helper"

class AdministratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
