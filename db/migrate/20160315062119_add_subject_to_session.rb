class AddSubjectToSession < ActiveRecord::Migration
  def change
    add_reference :sessions, :subject, index: true
    add_foreign_key :sessions, :subjects
  end
end
