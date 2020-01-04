# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#firsturn_mail.rb

require 'puppet'
require 'pp'
require 'net/smtp'

# ---- original file header ----
#
# @summary
#   Summarise what the function does here
#
Puppet::Functions.create_function(:'firstrun::firstrun_mail') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    
    is_firstrun = lookupvar('firstrun')
    mail_from = args[0]
    mail_to = args[1]
    mail_subject = args[2]
    mail_template = args[3]
    mail_type = "MIME-Version: 1.0\nContent-type: text/html"
    mail_header = "From: #{mail_from}\nTo: #{mail_to}\nSubject: #{mail_subject}\n#{mail_type}"
    mail_body = "#{mail_header}\n\n#{mail_template}"
    if is_firstrun == 'true'
      begin
        Net::SMTP.start('localhost', 25) do |smtpclient|
          smtpclient.send_message(mail_body, mail_from, mail_to)
        end
      rescue Exception => err
        print "Exception occured: " + err
      end
    elsif is_firstrun != 'true'
	end
  
  end
end