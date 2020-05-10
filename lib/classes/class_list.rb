# frozen_string_literal: true

module Classes
  class ClassList < Set
    def self.parse(str)
      new(str.scan(/[^\s]+/))
    end

    def add(arg)
      return self unless arg

      if arg.is_a?(Hash)
        arg = arg.map { |k, v| v && k }
      end

      unless arg.is_a?(Enumerable)
        arg = arg.to_s
        return self if arg.empty?

        if arg.match?(/\s/)
          arg = self.class.parse(arg)
        else
          return super(arg)
        end
      end

      merge(arg)
    end

    alias << add

    def to_s
      to_a.join(" ")
    end
  end
end
