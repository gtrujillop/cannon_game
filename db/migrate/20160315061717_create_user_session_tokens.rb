class CreateUserSessionTokens < ActiveRecord::Migration
  def change
    create_table :user_session_tokens do |t|
      t.string :name
      t.references :user_session, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_session_tokens, :user_sessions
  end
end
