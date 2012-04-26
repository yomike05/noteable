class CreateNoteableNotes < ActiveRecord::Migration
  def change
    create_table :noteable_notes do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :author
      t.text     :body
      t.datetime :created_at
    end
    add_index :noteable_notes, [:item_type, :item_id]
  end

  def self.down
    remove_index :noteable_notes, [:item_type, :item_id]
    drop_table :noteable_notes
  end
end
