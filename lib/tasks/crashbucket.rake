namespace :crashbucket do
  desc "Crash"
  task :crash => :environment do
    url               = (ENV['SERVER'] == "production") ? "http://crashbucket.com" : "http://staging.crashbucket.com"
    api_key           = ENV['API_KEY'] 
    bundle_identifier = ENV['BUNDLE_IDENTIFIER']
    if api_key && bundle_identifier
      response = RestClient.post "#{url}/api/apps/#{api_key}/reports.json", :report => { :os_version => "foo", :device => "foo", :app_version => "foo", :exc_name => "foo", :exc_reason => "foo", :backtrace => "foo", :bundle_identifier => bundle_identifier }
      if response.code == 200
        puts "----> SUCCESS"
      else
        puts "----> ERROR (#{response.code})"
      end
    else
      puts "API_KEY and BUNDLE_IDENTIFIER is required!"
    end

  end  
end