class AddPlaceholderToFormField < ActiveRecord::Migration[7.0]
  def change
    add_column :form_fields, :placeholder, :string
  end
end
