# frozen_string_literal: true

require "test_helper"

module Classes
  class HelpersTest < Minitest::Test
    def setup
      @helper = Class.new { include Helpers }.new
    end

    def test_single_arg
      r = @helper.classes("a")
      assert_kind_of ClassList, r
      assert_equal "a", r.to_s
    end

    def test_multiple_args
      r = @helper.classes("a", "b", "c")
      assert_kind_of ClassList, r
      assert_equal "a b c", r.to_s
    end

    def test_no_args
      r = @helper.classes
      assert_kind_of ClassList, r
      assert_equal "", r.to_s
    end
  end
end
