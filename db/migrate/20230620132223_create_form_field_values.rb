class CreateFormFieldValues < ActiveRecord::Migration[7.0]
  def change
    create_table :form_field_values do |t|
      t.string :form_field_value
      t.string :label_name
      t.string :form_name
      t.integer :form_id
      t.integer :form_field_id
      t.string :field_type
      t.string :checkbox_label_name
      t.timestamps
    end
  end
end



