module IRSForms
  module Editors
    class W9EntityClassificationEditor
      CHECKED = 'Yes'
      attr_accessor :val
      def collect_data
        {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]" => "1",
          "topmostSubform[0].Page1[0].FederalClassification[0].c1_7[0]" => "7"}
      end
    end
  end
end