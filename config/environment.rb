# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PhotoContest::Application.initialize!

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|  
      if html_tag =~ /<label/
        html_tag
      else
        html_tag + %(<span class="field_with_errors">*Required</span>).html_safe
      end
  end


