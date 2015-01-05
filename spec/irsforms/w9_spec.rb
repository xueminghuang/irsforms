require 'spec_helper'

describe IRSForms::W9 do
  describe 'setter' do
    it 'should be able add a new field on the fly' do
      w9 = IRSForms::W9.new
      
      w9.name = 'Xueming Huang'
      w9.business_name = 'DevSwat, LLC'
      w9.entity_class = 'LLC'
      w9.tax_class='S'
      w9.other_class = 'N/A'
      w9.exemption_payee_code = 123
      w9.exemption_from_fatca_code = 4
      w9.address = {:address_1=> '101 Main Str., apt #111', :city=>"Chicago", :state=> "IL", :zip=>'45832'}
      w9.requester_info = 'John Smith\n4239 Lincoln Ave., \nSchamburger, IL 48339'
      w9.accounts = "918723,123123,123123,1231232"
      w9.ssn = '123-45-6789' 
      w9.fein = '12-3456789' 
       
      w9.name.should eql("Xueming Huang")
      puts w9.collect_data
      w9.to_pdf      
    end
  end
end