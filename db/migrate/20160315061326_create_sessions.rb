class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :package, index: true

      t.timestamps null: false
    end
    add_foreign_key :sessions, :packages
  end
end
