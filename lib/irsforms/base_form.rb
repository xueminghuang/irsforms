require 'pdf_forms'

module IRSForms
  class BaseForm
    class << self
      def fields
        @fields ||= {}
      end
    end

    extend(IRSForms::FormField)

    def to_pdf
      pdftk = PdfForms.new('/usr/local/bin/pdftk')

      form_fields = pdftk.get_fields(template_file)
      form_fields.each do |f|
        puts "#{f.name} #{f.type} #{f.value_default} #{f.options}"
      end
      
      pdftk.fill_form template_file, 'output.pdf', collect_data
    end

    def collect_data
      data = {}
      self.class.fields.each do |key, pdf_field_editor|
        collected_data = pdf_field_editor.collect_data
        data.merge! collected_data unless collected_data.nil?        
      end
      
      data
    end
  end
end
