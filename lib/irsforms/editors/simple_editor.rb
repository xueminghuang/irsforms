module IRSForms
  module Editors
    class SimpleEditor
      def initialize(pdf_field_name)
        @pdf_field_name = pdf_field_name
      end

      def collect_data(val)
        {@pdf_field_name => val}
      end
    end
  end
end
