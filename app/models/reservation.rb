class Reservation < ApplicationRecord
  belongs_to :user
  validates :f_name, :l_name, :phone_num, :make, :model, :repair, :date, presence: true
  accepts_nested_attributes_for :user
end
