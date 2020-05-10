# frozen_string_literal: true

module Classes
  class Railtie < Rails::Railtie
    initializer "classes" do
      ActiveSupport.on_load :action_view do
        include Classes::Helpers
      end
    end
  end
end
