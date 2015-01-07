require "irsforms/editors/w9_entity_classification_editor"
require "irsforms/editors/w9_address_editor"
require "irsforms/editors/w9_ssn_editor"
require "irsforms/editors/w9_fein_editor"

module IRSForms
  
  # W9 Form
  # field list:
  # * name - 1
  # * business_name - 2
  # * business_classification
  # * tax_classification
  # * other_class
  class W9 < BaseForm
    template File.dirname(__FILE__) + '/w9.pdf'

    field 'name', 'topmostSubform[0].Page1[0].f1_1[0]', String, ''
    field 'business_name', 'topmostSubform[0].Page1[0].f1_2[0]', String, ''
    field 'tax_class', 'topmostSubform[0].Page1[0].FederalClassification[0].f1_3[0]', String, ''
    field 'other_class', 'topmostSubform[0].Page1[0].FederalClassification[0].f1_4[0]', String, ''
    field 'entity_class', IRSForms::Editors::W9EntityClassificationEditor.new, String, ''
    field 'exemption_payee_code', 'topmostSubform[0].Page1[0].Exemptions[0].f1_5[0]', String, ''
    field 'exemption_from_fatca_code', 'topmostSubform[0].Page1[0].Exemptions[0].f1_6[0]', String, ''
    field 'address', IRSForms::Editors::W9AddressEditor.new, Hash, ''
    field 'accounts', 'topmostSubform[0].Page1[0].f1_10[0]', String
    field 'requester_info', 'topmostSubform[0].Page1[0].f1_9[0]', String
    field 'ssn', IRSForms::Editors::W9SSNEditor.new, String, ''
    field 'fein', IRSForms::Editors::W9FEINEditor.new, String, ''
  end
end