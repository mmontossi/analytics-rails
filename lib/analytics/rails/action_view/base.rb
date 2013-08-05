module Analytics
  module Rails
    module ActionView
      module Base

        def google_analytics_include_tag(account)
          if ['production','test'].include? ::Rails.env
            script = <<-SCRIPT
              var _gaq = _gaq || [];
              _gaq.push(['_setAccount', '#{account}']);
              _gaq.push(['_trackPageview']);
              (function(){
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
              })();
            SCRIPT
            content_tag(:script, script.html_safe, type: 'text/javascript')
          end
        end

      end
    end
  end
end
