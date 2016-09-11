class Contact < ApplicationRecord
  belongs_to :user
  validates :contactName, :contactEmail, :contactPhone, presence: true
  validates :contactName, length: { minimum: 3}
end
