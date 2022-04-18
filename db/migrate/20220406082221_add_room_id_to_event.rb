class AddRoomIdToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :room_id, :integer
  end
end
