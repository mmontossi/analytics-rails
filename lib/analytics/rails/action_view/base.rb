module Analytics
  module Rails
    module ActionView
      module Base

        def google_analytics_include_tag(*args)
          options = args.extract_options!
          if ::Rails.env.production?
            [:variables, :events].each do |name|
              if options.has_key? name
                options[name].map! do |values|
                  values.map(&:inspect).join(', ').gsub('"',"'")
                end
              else
                options[name] = []
              end
            end
            variables = options[:variables].map do |values|
              "_gaq.push(['_setCustomVar', #{values}]);"
            end
            events = options[:events].map do |values|
              "ga('send', 'event', #{values});"
            end
            script = <<-SCRIPT
              var _gaq = _gaq || [];
              _gaq.push(['_setAccount', '#{args.first}']);
              #{variables.join("\n")}
              _gaq.push(['_trackPageview']);
              (function(){
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
              })();
              #{events.join("\n")}
            SCRIPT
            content_tag :script, script.html_safe, type: 'text/javascript'
          end
        end

      end
    end
  end
end
