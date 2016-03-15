class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.references :user, index: true
      t.references :session, index: true
      t.decimal :grade
      t.datetime :session_date

      t.timestamps null: false
    end
    add_foreign_key :user_sessions, :users
    add_foreign_key :user_sessions, :sessions
  end
end
