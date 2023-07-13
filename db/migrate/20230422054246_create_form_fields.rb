class CreateFormFields < ActiveRecord::Migration[7.0]
  def change
    create_table :form_fields do |t|
      t.text :label_name
      t.string :field_type
      t.integer :form_id
      t.boolean :required
      t.string :tooltip

      t.timestamps
    end
  end
end
