require "irsforms/editors/simple_editor"

module IRSForms
  module FormField
    def template(template_file_path)
      define_method "template_file" do
        template_file_path
      end 
    end
    
    # field_name is the field name (friendlier name)
    # pdf_field can be either a simple pdf field name or a complex editor (see editors)
    def field(field_name, pdf_field, klass, default = nil, validate = nil, msg ='')
      pdf_field_editor = pdf_field.is_a?(String) ? IRSForms::Editors::SimpleEditor.new(pdf_field) : pdf_field
      fields[field_name] = pdf_field_editor

      # getter
      define_method field_name do
        self.class.fields[field_name].val
      end

      # setter (includes validations)
      define_method "#{field_name}=" do | val |
        self.class.fields[field_name].val = val
      end
    end

    def const_field(field_name, pdf_field, val)
      pdf_field_editor = pdf_field.is_a?(String) ? IRSForms::Editors::SimpleEditor(pdf_field) : pdf_field
      
      fields[field_name] = pdf_field_editor
      pdf_field_editor.val = val

      # to_ach
      define_method field_name do
        self.class.fields[field_name].val
      end
    end
  end
end