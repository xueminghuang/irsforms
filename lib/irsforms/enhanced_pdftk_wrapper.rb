require 'pdf_forms'

module IRSForms
  class EnhancedPdftkWrapper < PdfForms::PdftkWrapper
	# pdftk.fill_form '/path/to/form.pdf', '/path/to/destination.pdf', :field1 => 'value 1'
    def fill_form(template, destination, data = {}, fill_options = {})
      q_template = safe_path(template)
      q_destination = destination.nil? ? '-' : safe_path(destination) 
      fdf = data_format(data)
      tmp = Tempfile.new('pdf_forms-fdf')
      tmp.close
      fdf.save_to tmp.path
      
      fill_options = {:tmp_path => tmp.path}.merge(fill_options)
      command = pdftk_command q_template, 'fill_form', safe_path(tmp.path), 'output', q_destination, add_options(fill_options)
      # output = %x{#{command}}

	  result = IO.popen(command, "wb+") do |pdf|	    
	    pdf.close_write
	    pdf.gets(nil) if destination.nil?
      end

	  raise "command failed: #{command}" if 

      # $? is thread safe per
      # http://stackoverflow.com/questions/2164887/thread-safe-external-process-in-ruby-plus-checking-exitstatus
      raise "command failed (exitstatus=#{$?.exitstatus}): #{command}" if empty_result?(destination, result) or !successful?($?)
      return result
    ensure
      tmp.unlink if tmp
    end

    private 
    def empty_result?(path, result)
      (path && File.size(path) == 0) || (path.nil? && result.to_s.strip.empty?)
    end

    def successful?(status)
      return true if status.success?

      # Some of the codes: https://code.google.com/p/wkhtmltopdf/issues/detail?id=1088
      # returned when assets are missing (404): https://code.google.com/p/wkhtmltopdf/issues/detail?id=548
      return true if status.exitstatus == 2 && error_handling?

      false
    end
  end
end