module Analytics
  module Rails
    module Extensions
      module ActionView
        module Base

          def google_analytics_include_tag(*args)
            if ::Rails.env.production?
              options = args.extract_options!.reverse_merge(variables: [], events: [])
              variables = options[:variables].map do |name, value|
                if value.is_a?(String)
                  value = "'#{value}'"
                end
                "ga('set', '#{name}', #{value});"
              end
              events = options[:events].map do |category, action|
                "ga('send', 'event', '#{category}', '#{action}');"
              end
              script = <<-SCRIPT
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                #{variables.join("\n")}
                ga('create', '#{args.first}', 'auto');
                ga('send', 'pageview');
                #{events.join("\n")}
              SCRIPT
              content_tag :script, script.html_safe, type: 'text/javascript'
            end
          end

        end
      end
    end
  end
end
