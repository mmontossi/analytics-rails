module Analytics
  module Rails
    module Extensions
      module ActionView
        module Base

          def google_analytics_include_tag(*args)
            if ::Rails.env.production?
              options = extract_google_analytics_options(args)
              id = args.first
              content_tag :script, <<-SCRIPT.html_safe, type: 'text/javascript'
                (function(i,s,o,g,r,a,m){i["GoogleAnalyticsObject"]=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,"script","https://www.google-analytics.com/analytics.js","ga");
                ga("create", "#{id}", "auto");
                ga("send", "pageview", #{options});
              SCRIPT
            end
          end

          def google_analytics_event_tag(*args)
            if ::Rails.env.production?
              options = extract_google_analytics_options(args)
              args = args.map(&:to_json).join(', ')
              content_tag :script, <<-SCRIPT.html_safe, type: 'text/javascript'
                ga("send", "event", #{args}, #{options});
              SCRIPT
            end
          end

          private

          def extract_google_analytics_options(args)
            args.extract_options!.transform_keys{ |key| key.to_s.camelize(:lower) }.to_json
          end

        end
      end
    end
  end
end
