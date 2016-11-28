module Analytics
  module Rails
    class Railtie < ::Rails::Railtie

      initializer :analytics do
        ::ActionView::Base.include(
          Analytics::Rails::Extensions::ActionView::Base
        )
      end

    end
  end
end
