module IRSForms
  module Editors
    class W9AddressEditor
      
      def collect_data(val)
        val ||= {}
        {"topmostSubform[0].Page1[0].Address[0].f1_7[0]" => val[:address_1],
          "topmostSubform[0].Page1[0].Address[0].f1_8[0]" => "#{val[:city]}, #{val[:state]} #{val[:zip]}"}
      end
    end
  end
end