class Beat < ApplicationRecord
  has_one_attached :preview
  has_one_attached :mp3
  has_one_attached :wav
  has_one_attached :free
  has_one_attached :cover

  has_many :licenses, inverse_of: :beat
end
