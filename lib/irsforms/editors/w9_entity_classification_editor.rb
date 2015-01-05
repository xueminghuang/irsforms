module IRSForms
  module Editors
    class W9EntityClassificationEditor
      SOLE_PROPRIETOR = 'SOLE_PROPRIETOR'
      C_CORP = 'C_CORP'
      S_CORP = 'S_CORP'
      PARTNERSHIP = 'PARTNERSHIP'
      TRUST = 'TRUST'
      LLC = 'LLC'
      OTHER = 'OTHER'

      attr_accessor :val

      def collect_data
        case self.val
        when SOLE_PROPRIETOR
          {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]" => "1"}
        when C_CORP
          {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[1]" => "2"}
        when S_CORP
          {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[2]" => "3"}
        when PARTNERSHIP
          {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[3]" => "4"}
        when TRUST
          {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[4]" => "5"}
        when LLC
          {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[5]" => "6"}
        else
          {"topmostSubform[0].Page1[0].FederalClassification[0].c1_7[0]" => "7"}
        end
      end
    end
  end
end