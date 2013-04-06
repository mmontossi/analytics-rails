module Analytics
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'analytics.helpers' do
        ::ActionView::Base.send :include, Analytics::Rails::ActionView::Base
      end

    end
  end
end
