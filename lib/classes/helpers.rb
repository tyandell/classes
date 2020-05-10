# frozen_string_literal: true

module Classes
  module Helpers
    def classes(*args)
      ClassList.new.merge(args)
    end
  end
end
