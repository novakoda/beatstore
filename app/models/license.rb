class License < ApplicationRecord
  belongs_to :beat, inverse_of: :licenses
end
