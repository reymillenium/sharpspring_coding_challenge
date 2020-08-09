class CreateNotes < ActiveRecord::Migration[6.0]
  def up
    create_table :notes do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end

    add_index :notes, :user_id
  end

  def down
    Note.destroy_all
    drop_table :notes
  end
end
