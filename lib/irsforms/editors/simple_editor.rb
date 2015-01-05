module IRSForms
  module Editors
    class SimpleEditor
      attr_accessor :val
      def initialize(pdf_field_name)
        @pdf_field_name = pdf_field_name
      end

      def collect_data
        {@pdf_field_name => self.val}
      end
    end
  end
end