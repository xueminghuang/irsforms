module IRSForms
  module Editors
    class W9FEINEditor
      def collect_data(val)
        fein = val
        if fein.to_s != ''
          fein = fein.gsub(/[^0-9]/, "")
          {"topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]" => fein[0,2],
        "topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]" => fein[2,8]}
        end
      end
    end
  end
end
