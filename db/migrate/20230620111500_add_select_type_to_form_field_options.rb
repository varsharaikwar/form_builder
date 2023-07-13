class AddSelectTypeToFormFieldOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :form_field_options, :select_type, :string
  end
end
