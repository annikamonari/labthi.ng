class CreateTrelloBoards < ActiveRecord::Migration
  def change
    create_table :trello_boards do |t|
      t.integer :part_id
      t.integer :board_id
      t.string :url

      t.timestamps
    end
  end
end
