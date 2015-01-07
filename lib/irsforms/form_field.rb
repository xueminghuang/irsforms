require "irsforms/editors/simple_editor"

module IRSForms
  module FormField
    # Define the template file for a IRSForm (at class level).
    #
    def template(template_file_path)
      define_method "template_file" do
        template_file_path
      end
    end

    # define a form field:
    #
    # field_name - the field name (friendlier name)
    # pdf_field - it can be either a simple pdf field name or a complex editor (see editors)
    #
    def field(field_name, pdf_field, klass, default = nil, validate = nil, msg ='')
      pdf_field_editor = pdf_field.is_a?(String) ? IRSForms::Editors::SimpleEditor.new(pdf_field) : pdf_field
      fields[field_name] = pdf_field_editor

      # getter
      define_method field_name do
        instance_variable_get( "@#{field_name}" )
      end

      # setter (includes validations)
      define_method "#{field_name}=" do | val |
        instance_variable_set( "@#{field_name}", val )
      end
    end

    # define a constant form field
    # field_name - the field name (friendlier name)
    # pdf_field - it can be either a simple pdf field name or a complex editor (see editors)
    # val - the constant value
    def const_field(field_name, pdf_field, val)
      pdf_field_editor = pdf_field.is_a?(String) ? IRSForms::Editors::SimpleEditor.new(pdf_field) : pdf_field

      fields[field_name] = pdf_field_editor

      define_method field_name do
        val
      end
    end
  end
end
