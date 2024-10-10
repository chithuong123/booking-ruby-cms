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
class Administrator < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable

  has_one :agency, required: false

  after_create :create_associated_agency
  after_destroy :destroy_agency_related

  enum role: [ :superadmin, :agency ]

  private

  def create_associated_agency
    agency = Agency.create(name: "#{first_name} #{last_name}'s Agency", administrator_id: id)
    self.agency_id = agency.id
    save
  end

  def destroy_agency_related
    ActiveRecord::Base.transaction do
      binding.pry
      if agency.present?
        agency.destroy!
      end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed => e
      Rails.logger.error("Failed to destroy agency: #{e.message}")
      raise ActiveRecord::Rollback
    end
  end
end
