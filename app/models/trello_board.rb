class TrelloBoard < ActiveRecord::Base
  validates_presence_of :part_id, :board_id, :url
end
