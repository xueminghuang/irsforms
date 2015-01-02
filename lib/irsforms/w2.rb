module IRSForms
  class W2 < BaseForm
    @fields = []
    @template = 'w2.pdf'
    
    field :name, String
    
    def collect_data
      
    end
  end
end