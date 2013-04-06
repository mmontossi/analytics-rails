module Analytics
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'analytics.rails' do
        ::ActionView::Base.send :include, Analytics::Rails::ActionView::Base
      end

    end
  end
end
