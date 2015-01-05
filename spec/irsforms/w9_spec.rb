require 'spec_helper'

describe IRSForms::W9 do
  describe 'generation' do
    it 'should be able to generate a pdf file with correct value filled in.' do
      w9 = IRSForms::W9.new

      w9.name = 'First Last'
      w9.business_name = 'Test PDF, LLC'
      w9.entity_class = IRSForms::Editors::W9EntityClassificationEditor::LLC
      w9.tax_class='S'
      w9.other_class = 'N/A'
      w9.exemption_payee_code = 123
      w9.exemption_from_fatca_code = 4
      w9.address = {:address_1=> '101 Main Str., apt #111', :city=>"Chicago", :state=> "IL", :zip=>'45832'}
      w9.requester_info = 'John Smith\n4239 Lincoln Ave., \nSchamburger, IL 48339'
      w9.accounts = "918723,123123,123123,1231232"
      w9.ssn = '123-45-6789'
      w9.fein = '12-3456789'

      w9.name.should eql("First Last")
      w9.business_name.should eql('Test PDF, LLC')
      # puts w9.collect_data
      output_file = "output-#{Time.now.strftime('%Y%m%d%H%M%S')}.pdf"
      w9.to_pdf output_file

      pdftk = IRSForms::EnhancedPdftkWrapper.new("/usr/local/bin/pdftk")
      form_fields = pdftk.get_fields(output_file)

      field_value(form_fields, 'topmostSubform[0].Page1[0].f1_1[0]').should == 'First Last'
      field_value(form_fields, 'topmostSubform[0].Page1[0].f1_2[0]').should == 'Test PDF, LLC'

      # clean up
      File.delete(output_file)
    end

    it 'should be able to output pdf to stdout.' do
      w9 = IRSForms::W9.new
      w9.name.should be_nil
      pdf_data = w9.to_pdf
      
      pdftk = IRSForms::EnhancedPdftkWrapper.new("/usr/local/bin/pdftk")
      output_file = "stdout-#{Time.now.strftime('%Y%m%d%H%M%S')}.pdf"
      File.open(output_file, 'w') { |file| file.write(pdf_data) }

      # clean up
      File.delete(output_file)
    end
  end
end

private

def field_value(form_fields, field_name)
  form_fields.each do |f|
    if f.name == field_name
      return f.value
    end
  end

  nil
end