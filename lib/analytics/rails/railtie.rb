module Analytics
  module Rails
    class Railtie < ::Rails::Railtie

      ActiveSupport.on_load(:action_view) do
        include Analytics::Rails::Helpers
      end

    end
  end
end
