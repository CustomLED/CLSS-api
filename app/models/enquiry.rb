class Enquiry < ApplicationRecord
  belongs_to :admin
  validates :phone_number, presence: true
  validates :admin, presence: true
  validates :description, presence: true
  validates :first_name, :last_name, :organisation, :email, presence: true
end
