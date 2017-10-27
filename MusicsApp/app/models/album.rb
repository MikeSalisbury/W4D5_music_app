class Album < ApplicationRecord
validates :band_id, presence: true

  belongs_to :band

end
