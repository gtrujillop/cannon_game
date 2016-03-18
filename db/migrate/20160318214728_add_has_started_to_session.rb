class AddHasStartedToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :has_started, :boolean
  end
end
