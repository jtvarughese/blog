class AddFnameAndLnameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users do |table|
      table.string :fname
      table.string :lname
    end
  end
end
