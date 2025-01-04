# db/migrate/[TIMESTAMP]_create_dunks.rb
class CreateDunks < ActiveRecord::Migration[8.0]
  def change
    create_table :dunks do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.text :description, null: false
      t.string :url, null: false
      t.text :themes, default: [].to_yaml # Store as YAML
      t.boolean :published, default: false

      t.timestamps
    end

    add_index :dunks, :published
  end
end