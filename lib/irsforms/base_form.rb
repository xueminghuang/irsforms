module IRSForms
  class BaseForm
    @fields = []
    class << self
      def fields
        @fields
      end
    end

    extend(IRSForms::FormField)

    def collect_data
      data = {}
    end

    def to_pdf
      raise 'need implementation'
    end

  end
end
