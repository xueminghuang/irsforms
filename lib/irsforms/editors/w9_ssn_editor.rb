module IRSForms
  module Editors
    class W9SSNEditor
      def collect_data(val)
        ssn = val
        if ssn.to_s != ''
          ssn = ssn.gsub(/[^0-9]/, "")
          {"topmostSubform[0].Page1[0].SSN[0].f1_11[0]" => ssn[0,3],
           "topmostSubform[0].Page1[0].SSN[0].f1_12[0]" => ssn[3,2],
           "topmostSubform[0].Page1[0].SSN[0].f1_13[0]" => ssn[5,4]}
        end
      end
    end
  end
end
