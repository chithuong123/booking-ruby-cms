class CreateArkhams < ActiveRecord::Migration[7.2]
  def change
    create_table :arkhams do |t|
      t.timestamps
    end
  end
end
