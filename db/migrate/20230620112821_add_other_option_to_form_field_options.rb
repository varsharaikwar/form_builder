class AddOtherOptionToFormFieldOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :form_field_options, :other_option, :string
  end
end
