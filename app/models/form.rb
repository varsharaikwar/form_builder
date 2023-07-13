class Form < ApplicationRecord
    has_many :form_fields
    has_many :form_field_values
end
