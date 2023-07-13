class FormsController < ApplicationController
    before_action :set_form, only: [:show, :custom_form_value_new]

    def custom_form_new 
    end
    
    def custom_form_create
        @form = Form.create(name: params[:form_name])
        @form_fields = JSON.parse(params[:form_fields]) 
        @form_fields.each do |form_param|
            form_field = FormField.create(label_name: form_param["label"].gsub("&nbsp\;",""), field_type: form_param["type"], form_id: @form.id, required: form_param["required"], tooltip: form_param["description"], placeholder: form_param["placeholder"])
            if (form_param["type"] == "checkbox-group")
                form_param["values"].each do |option|
                    FormFieldOption.create(label_name: option["label"], option_name: option["value"], field_type: form_param["type"], form_field_id: form_field.id, select_type: option["selected"], other_option: form_param["other"])
                end 
            elsif(form_param["type"] == "radio-group")
                form_param["values"].each do |option|
                    FormFieldOption.create(label_name: option["label"], option_name: option["value"], field_type: form_param["type"], form_field_id: form_field.id, select_type: option["selected"], other_option: form_param["other"] )
                end
            elsif (form_param["type"] == "select")
                form_param["values"].each do |option|
                    FormFieldOption.create(label_name: option["label"], option_name: option["value"], field_type: form_param["type"], form_field_id: form_field.id, select_type: option["selected"])
                end
            elsif (form_param["type"] == "autocomplete")
                form_param["values"].each do |option|
                    FormFieldOption.create(label_name: option["label"], option_name: option["value"], field_type: form_param["type"], form_field_id: form_field.id)
                end
            end
        end
        respond_to do |format|
            format.json { render json: {url: form_path(@form), message: "Custom Form was created successfully."}, status: 200 }
            format.html { redirect_to custom_forms_owner_index_path}
        end
    end

    def show 
    end

    def custom_form_value_new
        @form_field_value = FormFieldValue.new
    end

    def custom_form_value_create
        if params[:custom_form].present?
            key = params["custom_form"].keys.to_s.gsub('["', '').gsub('"]', '')
            @form_field = Form.where(id: params[:form_id])
            custom_form = @form_field.first
            custom_form.form_fields.order(created_at: :asc).each do |form_field|
                if form_field.field_type == "checkbox-group"
                    params[:custom_form][key][form_field.label_name].each do |label,checkbox_option|
                        FormFieldValue.create(form_field_value: label, label_name: form_field.label_name, form_name: custom_form.name, form_field_id: form_field.id, form_id: custom_form.id, field_type: form_field.field_type)
                    end
                end
                FormFieldValue.create(form_field_value: params[:custom_form][key][form_field.label_name], label_name: form_field.label_name, form_name: custom_form.name, form_field_id: form_field.id, form_id: custom_form.id, field_type: form_field.field_type)
            end
        end
    end
   
    private

    def set_form
        @form = Form.find(params[:id]) 
    end

    def form_field_values_params
        params.require(:form_field_values).permit(:form_field_value, :label_name, :form_name, :form_id, :form_field_id, :field_type, :checkbox_label_name)
    end
end
