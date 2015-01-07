require 'spec_helper'

describe IRSForms::Editors::SimpleEditor do
  it 'should be able add a new field on the fly' do
    editor = IRSForms::Editors::SimpleEditor.new("test_field")
    editor.collect_data(100).should == {"test_field" => 100} 
  end
end
