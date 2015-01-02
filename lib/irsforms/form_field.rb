module IRSForms
  module FormField
    def field(name, klass, stringify = nil, default = nil, validate = nil, msg ='')
      fields << name

      # getter
      define_method name do
        instance_variable_get( "@#{name}" )
      end

      # setter (includes validations)
      define_method "#{name}=" do | val |
        if validate.kind_of?(Regexp)
          unless val =~ validate
            raise RuntimeError, "#{val} does not match Regexp #{validate} for field #{name}"
          end
        elsif validate.respond_to?(:call) # Proc with value as argument
          unless validate.call(val)
            raise RuntimeError, "#{val} does not pass validation Proc for field #{name}"
          end
        end

        instance_variable_set( "@#{name}", val )
      end

      define_method  "#{name}_to_html" do
        val = instance_variable_get( "@#{name}" )

        if val.nil?
          if default.kind_of?(Proc)
            val = default.call
          elsif default
            val = default
          else
            raise RuntimeError, "val of #{name} is nil"
          end
        end

        if val.kind_of?(String)
          if RUBY_VERSION < '1.9'
            val = Iconv.conv('ASCII//IGNORE', 'UTF8', val)
          else
            val = val.encode Encoding.find('ASCII'), ENCODING_OPTIONS
          end
        end

        if stringify
          stringify.call(val)
        else
          val
        end
      end
    end

    def const_field(name, val)
      fields << name

      # to_ach
      define_method  "#{name}_to_html" do
        val
      end
    end
  end
end