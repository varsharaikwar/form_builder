class CreateFormFieldOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :form_field_options do |t|
      t.text :label_name
      t.text :option_name
      t.string :field_type
      t.integer :form_field_id

      t.timestamps
    end
  end
end
