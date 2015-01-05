require 'spec_helper'

describe IRSForms::Editors::W9EntityClassificationEditor do
  it 'should be able add a new field on the fly' do
    editor = IRSForms::Editors::W9EntityClassificationEditor.new
    editor.val = "LLC"
    editor.val.should == "LLC"
    editor.collect_data.should == {"topmostSubform[0].Page1[0].FederalClassification[0].c1_1[6]" => "yes"} 
  end
end