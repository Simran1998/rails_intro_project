class ChangeColumnNameInSchool < ActiveRecord::Migration[7.0]
  def change
    rename_column :schools, :type, :gender
  end
end
