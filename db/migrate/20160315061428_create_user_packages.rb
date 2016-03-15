class CreateUserPackages < ActiveRecord::Migration
  def change
    create_table :user_packages do |t|
      t.references :user, index: true
      t.references :package, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_packages, :users
    add_foreign_key :user_packages, :packages
  end
end
