class CreateSessionResources < ActiveRecord::Migration
  def change
    create_table :session_resources do |t|
      t.string :name
      t.string :url
      t.references :session, index: true

      t.timestamps null: false
    end
    add_foreign_key :session_resources, :sessions
  end
end
