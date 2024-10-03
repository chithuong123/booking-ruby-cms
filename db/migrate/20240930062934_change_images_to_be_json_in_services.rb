class ChangeImagesToBeJsonInServices < ActiveRecord::Migration[7.2]
  def change
    change_column :services, :images, 'json USING CAST(images AS json)'
  end
end
