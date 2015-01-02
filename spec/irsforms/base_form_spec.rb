require 'spec_helper'
      
describe IRSForms::BaseForm do
  describe 'setter' do
    it 'should be able add a new field on the fly' do
      form = IRSForms::BaseForm.new
      form.field :name, String
      form.name = 'testname'
      form.name.should == 'testname'
    end
  end
end