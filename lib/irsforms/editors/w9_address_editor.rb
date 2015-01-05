module IRSForms
  module Editors
    class W9AddressEditor
      attr_accessor :val
      def collect_data
        {"topmostSubform[0].Page1[0].Address[0].f1_7[0]" => self.val[:address_1],
          "topmostSubform[0].Page1[0].Address[0].f1_8[0]" => "#{self.val[:city]}, #{self.val[:state]} #{self.val[:zip]}"}
      end
    end
  end
end