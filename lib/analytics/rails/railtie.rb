module Analytics
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'analytics.action_view' do
        ActiveSupport.on_load :action_view do
          ::ActionView::Base.include(
            Analytics::Rails::Extensions::ActionView::Base
          )
        end
      end

    end
  end
end
