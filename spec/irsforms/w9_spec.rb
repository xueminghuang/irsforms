require 'spec_helper'

describe IRSForms::W9 do
  describe 'setter' do
    it 'should be able add a new field on the fly' do
      form = IRSForms::W9.new
      form.to_pdf
    end
  end
end