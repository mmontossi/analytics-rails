module Analytics
  module Rails
    module Extensions
      module ActionView
        module Base

          def google_analytics_include_tag(*args)
            if ::Rails.env.production?
              options = args.extract_options!
              id = args.first
              variables = options.to_json
              content_tag :script, <<-SCRIPT.html_safe, type: 'text/javascript'
                (function(i,s,o,g,r,a,m){i["GoogleAnalyticsObject"]=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,"script","https://www.google-analytics.com/analytics.js","ga");
                ga("create", "#{id}", "auto");
                ga("send", "pageview", #{variables});
              SCRIPT
            end
          end

          def google_analytics_event_tag(*args)
            if ::Rails.env.production?
              options = args.extract_options!
              args = args.map(&:to_json).join(', ')
              variables = options.to_json
              content_tag :script, <<-SCRIPT.html_safe, type: 'text/javascript'
                ga("send", "event", #{args}, #{variables});
              SCRIPT
            end
          end

        end
      end
    end
  end
end
