require 'pdf_forms'

module IRSForms
  class BaseForm
    class << self
      def fields
        @fields ||= {}
      end
    end

    extend(IRSForms::FormField)

    def to_pdf(path = nil)
      pdftk = EnhancedPdftkWrapper.new(pdftk_path)
      pdftk.fill_form template_file, path, collect_data
    end

    def collect_data
      data = {}
      self.class.fields.each do |field_name, pdf_field_editor|
        collected_data = pdf_field_editor.collect_data(instance_variable_get( "@#{field_name}" ))
        data.merge! collected_data unless collected_data.nil?        
      end
      
      data
    end

    private 
    def pdftk_path
      # '/usr/local/bin/pdftk'
      @pdftk_path ||= (defined?(Bundler::GemfileError) && File.exists?('Gemfile') ? `bundle exec which pdftk` : `which pdftk`).chomp
    end
  end
end
