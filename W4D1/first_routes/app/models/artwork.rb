# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true
  validates :img_url, presence: true, uniqueness: true
  validates_uniqueness_of :title, scope: :artist_id

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :Artwork

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer


end
