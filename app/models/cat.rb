# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birthdate   :date             not null
#  color       :string
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = %w(black white gray orange brown)
  validates :birthdate, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS}
  validates :sex, inclusion: {in: ['M', 'F']}

  has_many :rental_requests,
  class_name: :CatRentalRequest,
  foreign_key: :cat_id,
  primary_key: :id,
  dependent: :destroy

  def age
    (Time.now.to_s(:number).to_i - birthdate.to_time.to_s(:number).to_i)/10e9.to_i
  end


end
