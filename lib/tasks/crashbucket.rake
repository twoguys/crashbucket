namespace :crashbucket do
  desc "Crash"
  task :crash => :environment do
    url               = (ENV['SERVER'] == "production") ? "http://crashbucket.com" : "http://staging.crashbucket.com"
    api_key           = ENV['API_KEY'] 
    bundle_identifier = ENV['BUNDLE_IDENTIFIER']
    
    puts "api key:#{api_key}"
    puts "bundle id:#{bundle_identifier}"
    puts "url:#{url}"
    
    if api_key && bundle_identifier
      
      report = {
        :device => "Crash Report Generator",
        :os_version => "1.0",
        :app_version => "1.0",
        :exec_name => "Test Crash Reporter",
        :exec_reason => "Rake task used generate a test crash",
        :bundle_identifier => bundle_identifier,
        :backtrace => "0   CoreFoundation                      0x023fa8fc __exceptionPreprocess + 156\n1   libobjc.A.dylib                     0x025485de objc_exception_throw + 47\n2   CoreFoundation                      0x023fc42b -[NSObject(NSObject) doesNotRecognizeSelector:] + 187\n3   CoreFoundation                      0x0236c116 ___forwarding___ + 966\n4   CoreFoundation                      0x0236bcd2 _CF_forwarding_prep_0 + 50\n5   CrashApp                            0x000021d2 -[CAAppDelegate crash:] + 48\n6   UIKit                               0x002bfe14 -[UIApplication sendAction:to:from:forEvent:] + 119\n7   UIKit                               0x003496c8 -[UIControl sendAction:to:forEvent:] + 67\n8   UIKit                               0x0034bb4a -[UIControl(Internal) _sendActionsForEvents:withEvent:] + 527\n9   UIKit                               0x0034a6f7 -[UIControl touchesEnded:withEvent:] + 458\n10  UIKit                               0x002e32ff -[UIWindow _sendTouchesForEvent:] + 567\n11  UIKit                               0x002c51ec -[UIApplication sendEvent:] + 447\n12  UIKit                               0x002c9ac4 _UIApplicationHandleEvent + 7495\n13  GraphicsServices                    0x02c01afa PurpleEventCallback + 1578\n14  CoreFoundation                      0x023dbdc4 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 52\n15  CoreFoundation                      0x0233c737 __CFRunLoopDoSource1 + 215\n16  CoreFoundation                      0x023399c3 __CFRunLoopRun + 979\n17  CoreFoundation                      0x02339280 CFRunLoopRunSpecific + 208\n18  CoreFoundation                      0x023391a1 CFRunLoopRunInMode + 97\n19  GraphicsServices                    0x02c002c8 GSEventRunModal + 217\n20  GraphicsServices                    0x02c0038d GSEventRun + 115\n21  UIKit                               0x002cdb58 UIApplicationMain + 1160\n22  CrashApp                            0x00002020 main + 102\n23  CrashApp                            0x00001fb1 start + 53\n24  ???                                 0x00000001 0x0 + 1"
      }
      
      response = RestClient.post "#{url}/api/apps/#{api_key}/reports.json", report
      
      if response.code == 200
        puts "----> SUCCESS"
      else
        puts "----> ERROR (#{response.body})"
      end
      
    else
      puts "API_KEY and BUNDLE_IDENTIFIER is required!"
    end

  end  
end