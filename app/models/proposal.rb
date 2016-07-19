class Proposal < ApplicationRecord
  validates :name, :mail, :phone, :description, presence: true
end
