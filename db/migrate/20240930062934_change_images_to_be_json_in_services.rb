class ChangeImagesToBeJsonInServices < ActiveRecord::Migration[6.0]
  def up
    # Chuyển đổi mảng chuỗi thành JSON
    execute <<-SQL
      ALTER TABLE services
      ALTER COLUMN images TYPE json
      USING to_json(images::text[]);
    SQL
  end

  def down
    # Chuyển đổi lại JSON thành mảng chuỗi
    execute <<-SQL
      ALTER TABLE services
      ALTER COLUMN images TYPE character varying[]
      USING ARRAY(SELECT jsonb_array_elements_text(images::jsonb));
    SQL
  end
end
