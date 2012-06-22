class ChangeTypeToPhonetypeInPhones < ActiveRecord::Migration
  def up
    rename_column :phones, :type, :phone_type
  end

  def down
    rename_column :phones, :phone_type, :type
  end
end
